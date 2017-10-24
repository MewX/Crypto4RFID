import sys
import os
from joblib.logger import pformat
import pprint
import logging
import time
import re
import csv
from _csv import writer
sys.path.append(os.path.abspath(os.path.join(__file__, '..', '..', '..')))

from argparse import ArgumentParser
from logging import getLogger
from sllurp.llrp import LLRP_PORT, LLRPClientFactory
import smokesignal
from tornado.escape import json_decode
from tornado.platform.twisted import TwistedIOLoop
from tornado.web import RequestHandler, Application
from tornado.websocket import WebSocketClosedError, WebSocketHandler
from twisted.internet import reactor
from ctypes import *

from sllurp.WModules import i2h

#path directory
pathDir = os.path.dirname(__file__)

# Benchmark Parameter
totalCnt            = 0
retryCnt            = 0

# Hash function 
xtea_dll = cdll.LoadLibrary("./hash/xtea.so")
hashChecksum        = 0
hashAddr            = 0x1800

# WISP Control global variables.
fac                 = None
proto               = None
tagReport           = 0

#parameters
bytes_per_read      = 0x20
wordCnt             = str(int('{:02X}'.format(bytes_per_read)) - 4)
AccssSpecType       = '1F'              # 1F is reading WISP otherwise writing WISP
AttesSpecType       = '2F'
accessType          = ''
accessId            = 1
OCV                 = 1
StopTrigger         = 1
OpSpecs             = []
OpSpecsIdx          = 2
writeIdx            = 0

logger              = getLogger('Wsllurp')

startTime           = 0.0
endTime             = 0.0

# The Intel Hex file.
hexfile             = None
hexFileLines        = None
current_line        = None
hexFileIdx          = 0

checkCnt            = 5


def startTimeMeasurement():
    global startTime
    startTime = time.time()

def getTimeMeasurement():
    global endTime
    endTime = time.time()
    return "{:.03f}".format(endTime - startTime)

def init_logging():
    
    logLevel = logging.INFO
    logFormat = '%(asctime)s %(name)s: %(levelname)s: %(message)s'
    formatter = logging.Formatter(logFormat)
    stderr = logging.StreamHandler()
    stderr.setFormatter(formatter)

    root = logging.getLogger()
    root.setLevel(logLevel)
    root.handlers = [stderr]

    logger.log(logLevel, 'log level: %s', logging.getLevelName(logLevel))


class BaseHandler(RequestHandler):
    def get(self):
        self.render("base.html")

class UploadFileHandler(RequestHandler):
    def post(self):
        hexfile_dir         = pathDir + '/static/files/' + self.request.files["hexFile"][0].filename
        hexfile             = open(hexfile_dir,"w")
        hexfile.write(self.request.files["hexFile"][0].body)
        hexfile.close;
        self.write("Success!: " + self.request.files["hexFile"][0].filename)

class WebSocketHandler(WebSocketHandler):
    def __init__(self, *args, **kwargs):
        super(WebSocketHandler, self).__init__(*args, **kwargs)
        self.connected_clients = 0

        @smokesignal.on('rfid')
        def _RFID_cb(payload):
            self.update_rfid(payload)

    def open(self):
        self.connected_clients += 1
        logger.debug("WebSocket opened")

    def on_message(self, message):
        try:
            logger.info(message)
            data = json_decode(message)
            logger.info(data)
            reader_control(data)
            logger.debug("got message %r", message)
        except ValueError:
            logger.info('error loading json: {}'.format(message))

    def on_close(self):
        self.connected_clients -= 1
        logger.debug("WebSocket closed")

    def update_rfid(self, payload):
        if self.connected_clients > 0:
            try:
                self.write_message(payload)
                logger.debug('websocket write: {}'.format(pformat(payload)))
            except WebSocketClosedError:
                logger.debug('attempting to send websocket message with no connected clients')


def trasferWriteWISP(seen_tag, ops):
    global accessId, hexFileIdx
    # AsscessSpec Writing message for WISP5
    logger.info("hexFileLines : " + hexFileLines[hexFileIdx] + " hexFileIdx size: " + str(hexFileIdx) + " OpSpecSize : " + str(len(OpSpecs)))
    logger.info(OpSpecs)
    
    smokesignal.emit('rfid', {
        'writeWispTags': [{'writeWisp' : hexFileLines[hexFileIdx]
                          , 'EPCvalue' : seen_tag["EPC-96"]
                          , 'OpSpecId' : seen_tag["OpSpecResult"][ops]["OpSpecID"] 
                          , 'status' : 'Success'} ],})    
    
    if (seen_tag["EPC-96"][22:] == 'ff') :
        fac.nextAccessSpec(opSpecs = [OpSpecs[hexFileIdx]], 
            accessSpec = {'ID':accessId, 'StopParam': {'AccessSpecStopTriggerType': StopTrigger, 'OperationCountValue': OCV,},})  
    else :
        if (hexFileIdx == (len(OpSpecs) - 1)):
            logger.info(" EOF reached.")
        else:
            logger.info("WriteWisp : " + str(hexFileIdx))
            accessId += 1
            hexFileIdx += 1                                    
            fac.nextAccessSpec(opSpecs = [OpSpecs[hexFileIdx]], 
                accessSpec = {'ID':accessId, 'StopParam': {'AccessSpecStopTriggerType': StopTrigger, 'OperationCountValue': OCV,},})  

def trasferRead(seen_tag, ops):
    # Result for Normal tags
    smokesignal.emit('rfid', {
        'readTags': [{'read' : seen_tag["OpSpecResult"][ops]["ReadData"]
                    , 'EPCvalue' : seen_tag["EPC-96"] }],})   

def trasferReadAttWISP(seen_tag, ops) :
    receivedChkSum = seen_tag["OpSpecResult"][ops]["ReadData"];
    logger.info("receivedChkSum : " + receivedChkSum + " hashChecksum : " + hashChecksum)
    
    if(receivedChkSum == hashChecksum) :
        logger.info("Success")
        smokesignal.emit('rfid', {
            'attestation': [{'result' : 'Verified' 
                            , 'EPCvalue' : seen_tag["EPC-96"]}],})
    else :
        logger.info("Fail")
        smokesignal.emit('rfid', {
            'attestation': [{'result' : 'Failed'}],})     
        
        
def trasferReadWISP(seen_tag, ops) :
    global tagReport, accessId, OpSpecsIdx
    
    # AsscessSpec Reading message for WISP5
    logger.info("OpSpecsIdx : " + str(OpSpecsIdx) + " OpSpecs.__len__(): " + str(OpSpecs.__len__()) )
    smokesignal.emit('rfid', {
        'readWispTags': [{'readWisp' : seen_tag["OpSpecResult"][ops]["ReadData"]
                          , 'EPCvalue' : seen_tag["EPC-96"]
                          , 'OpSpecId' : seen_tag["OpSpecResult"][ops]["OpSpecID"] 
                          , 'AccessType' : accessType 
                          , 'RetryCnt' : retryCnt 
                          , 'TotalCnt' : totalCnt
                          , 'Time' : getTimeMeasurement()
                          }],})  
    
    if(OpSpecsIdx < OpSpecs.__len__()) :
        logger.info("ReadWisp : ")
        accessId += 1
        fac.nextAccessSpec(opSpecs = [OpSpecs[OpSpecsIdx], OpSpecs[OpSpecsIdx+1]], 
            accessSpec = {'ID':accessId, 'StopParam': {'AccessSpecStopTriggerType': StopTrigger, 'OperationCountValue': OCV,},})
        OpSpecsIdx += 2
        
    tagReport += 1


def tag_seen_callback(llrpMsg):
    
        """Function to run each time the reader reports seeing tags."""
        global tagReport, accessId, OpSpecsIdx, hexFileIdx, retryCnt, totalCnt
        tags = llrpMsg.msgdict['RO_ACCESS_REPORT']['TagReportData']
        
        if tags:
            smokesignal.emit('rfid', {
                'tags': tags,})          
        
        if len(tags):
            for tag in tags:
#                 logger.info('saw!! tag(s): {}'.format(pprint.pformat(tags)))
                if("OpSpecResult" in tags[0]):
                    for ops in tag["OpSpecResult"]:
                        logger.info('saw tag(s): {}'.format(pprint.pformat(tags)))
                        # Get Readdata from Tag
                        if ("ReadData" in tag["OpSpecResult"][ops] and tag["OpSpecResult"][ops]["Result"] == 0):
                            logger.info("Readdata = " + tag["OpSpecResult"][ops]["ReadData"] + " accessType :" + accessType)
                            totalCnt += 1
                            if (accessType == 'readWisp') :
                                trasferReadWISP(tag, ops)
                                
                            elif (accessType == 'readWispAtt') :
                                trasferReadAttWISP(tag, ops)
                            
                            else :
                                trasferRead(tag, ops)
                            
                            retryCnt = 0
                                
                        elif(0 < tag["OpSpecResult"][ops]["Result"]):
                            totalCnt += 1
                            retryCnt += 1
                            if (accessType == 'readWisp') :
                                print ('retry count : ', retryCnt)
                                print ('OpSpecs[OpSpecsIdx] : ', OpSpecs[OpSpecsIdx])
                                print ('OpSpecs[OpSpecsIdx+1] : ', OpSpecs[OpSpecsIdx+1])
                                OpSpecsIdx -= 2
                                fac.nextAccessSpec(opSpecs = [OpSpecs[OpSpecsIdx], OpSpecs[OpSpecsIdx+1]], 
                                    accessSpec = {'ID':accessId, 'StopParam': {'AccessSpecStopTriggerType': StopTrigger, 'OperationCountValue': OCV,},})
                                OpSpecsIdx += 2
                            elif(accessType == 'writeWisp'):
                                smokesignal.emit('rfid', {
                                    'writeWispTags': [{'writeWisp' : hexFileLines[hexFileIdx]
                                                      , 'EPCvalue' : tag["EPC-96"]
                                                      , 'OpSpecId' : tag["OpSpecResult"][ops]["OpSpecID"] 
                                                      , 'status' : 'Failed'} ],})
                                
                        elif(2 < tag["OpSpecResult"][ops]["NumWordsWritten"]):
                            if (accessType == 'writeWisp') :
                                trasferWriteWISP(tag, ops)
                                
                        print getTimeMeasurement()
                else:
                    logger.info('no tags seen')
                return
            for tag in tags:
                tagReport += tag['TagSeenCount'][0]       
        
def parse_args():
    parser = ArgumentParser(description='Simple RFID Reader Inventory')
    parser.add_argument('host', help='hostname or IP address of RFID reader', nargs='*')
    parser.add_argument('-p', '--port', default=LLRP_PORT, type=int, help='port to connect to (default {})'.format(LLRP_PORT))
    parser.add_argument('-n', '--report-every-n-tags', default=1, type=int, dest='every_n', metavar='N', help='issue a TagReport every N tags')
    parser.add_argument('-a', '--antennas', default='1', help='comma-separated list of antennas to enable')
    parser.add_argument('-X', '--tx-power', default=0, type=int, dest='tx_power', help='Transmit power (default 0=max power)')
    parser.add_argument('-M', '--modulation', default='WISP5', help='modulation (default M8)')
    parser.add_argument('-T', '--tari', default=0, type=int, help='Tari value (default 0=auto)')
    parser.add_argument('-s', '--session', default=2, type=int, help='Gen2 session (default 2)')
    parser.add_argument('-P', '--tag-population', default=4, type=int, dest='population', help="Tag Population value (default 4)")
    return parser.parse_args()

#Reader Operation Control
def reader_control(arg):
    global accessType
    accessType = arg['type']
    
    if accessType == 'resume':
        fac.resumeInventory()
    elif accessType == 'pause':
        fac.pauseInventory()
    else :
        access_memory(arg)

def polite_shutdown(factory):
    return factory.politeShutdown()

def access_memory(arg):
    global retryCnt, totalCnt
    retryCnt = 0
    totalCnt = 0
    
    if(arg['type'] == 'readWisp'):
        for pto in fac.protocols: 
            BlockReadAccess(pto, arg)
    elif(arg['type'] == 'writeWisp'):
        for pto in fac.protocols: 
            BlockWriteAccess(pto, arg)  
    elif(arg['type'] == 'readWispAtt'):
        print arg
        for pto in fac.protocols: 
            BlockChallengeAccess(pto, arg)   
    else :
        for pto in fac.protocols: 
            ReadWriteAccess(pto, arg)

def getBlockWriteMessage(OpSpecID, count, content):
    
    write_message = {
        'OpSpecID': OpSpecID,
        'MB': 3,
        'WordPtr': 0,
        'AccessPassword': 0,
        'WriteDataWordCount': count,
        'WriteData': content.decode('hex'),
    }
    return write_message 

def getReadMessage(OpSpecID, wCount = wordCnt):
    read_message = {
        'OpSpecID': OpSpecID,
        "MB": 3, # EPC = 1 user memory = 3
        "WordPtr": 0,
        "AccessPassword": 0,
        "WordCount": wCount,
    }
    print (read_message)
    
    return read_message 

def BlockWriteAccess(pto, arg):
    global hexfile, OpSpecs, proto, hexFileIdx, accessId, hexFileLines
    
    proto           = pto
    dir             = pathDir + '/static/files/'
    hexfile         = open(dir + arg['file'], 'r')
    hexFileLines    = hexfile.readlines()
    
    total_words_to_send = 0
    accessId            = 1
    hexFileIdx          = 0
    OpSpecs             = []
    
    for i in range(0,len(hexFileLines)-1):
        dataCnt = hexFileLines[i][1:3]
        if (len(hexFileLines[i][1:3]) > 0) :
            total_words_to_send = total_words_to_send + ((len(hexFileLines[i]) - 12)/4)
            
            writeData = "{:02x}".format((len(hexFileLines[i])-3)/4) + dataCnt + hexFileLines[i][3:7] + hexFileLines[i][9:(len(hexFileLines[i])-3)]
            writeData += calcChecksum(writeData)
            print ("writeData : ", writeData, "  dataCnt ", dataCnt)
            if(dataCnt != '00') :
                OpSpecs.append(getBlockWriteMessage(i, (len(writeData) / 4), writeData))
    
    print('Bytes to send: ' + str(total_words_to_send*2))
    
    return proto.startAccess(readWords=None,
        writeWords=[OpSpecs[hexFileIdx]], accessStopParam = {'AccessSpecStopTriggerType': 1, 'OperationCountValue': 5,})

def BlockReadAccess(pto, arg):
    
    global OpSpecs, proto, OpSpecsIdx, accessId
    proto           =  pto
    OpSpecsIdx      = 2
    accessId        = 1
    
    start_address   = int(arg['startAddr'], 16)
    end_address     = int(arg['endAddr'], 16)
    OpSpecs         = []
    cnt             = 1
    
    for i in range(start_address, end_address, bytes_per_read):
        hexContent = AccssSpecType + wordCnt + i2h(i)
        print ("hexContent  : ", hexContent)
        OpSpecs.append(getBlockWriteMessage(cnt, 2, hexContent))
        OpSpecs.append(getReadMessage((cnt * 10) + 1))
        cnt += 1
        
#     target = {
#         "MB" : 1, # EPC = 1, userMem = 3
#         "M": 1,
#         "Pointer" : 32,
#         "MaskBitCount": 16,
#         "TagMask": "\xFF\xFF",#"\x00\xFF\xFF\x00",#\xFF\xFF\xFF\xFF",
#         "DataBitCount": 16,#16*2,
#         "TagData": "0b00".decode("hex"),#"\xF1\x65\x34\x00",  # \xF1\x65\x34\x00\x00\x34\xB0\x07" # tag 269 needs 34000269
#     }        
        
#     writeSpecParam = {
#         'OpSpecID': 1,
#         'MB': 3,
#         'WordPtr': 0,
#         'AccessPassword': 0,
#         'WriteDataWordCount': 2,
#         'WriteData': '\x16\xCC\x00\x00',
#     }
#      
#     readSpecParam = {0
#         'OpSpecID': 11,
#         "MB": 3, # EPC = 1 user memory = 3
#         "WordPtr": 0,
#         "AccessPassword": 0,
#         "WordCount": 16,
#     }
     
    startTimeMeasurement()
     
    proto.startAccessSpec(None, opSpecs = [OpSpecs[0], OpSpecs[1]],
        accessSpecParams = {'ID':accessId, 'StopParam': {'AccessSpecStopTriggerType': StopTrigger, 'OperationCountValue': OCV,},})

#     OpSpecs = [];
#     writeSpecParam = {
#         'OpSpecID': 2,
#         'MB': 3,
#         'WordPtr': 0,
#         'AccessPassword': 0,
#         'WriteDataWordCount': 2,
#         'WriteData': '\x16\xCC\x19\x00',
#     #                 'WriteData': '\x30\x08\x33\xb2\xdd\xdd\x01\x41\x11\x11\x22\x22', # XXX allow user-defined pattern
#     }
#      
#     readSpecParam = {
#         'OpSpecID': 12,
#         "MB": 3, # EPC = 1 user memory = 3
#         "WordPtr": 0,
#         "AccessPassword": 0,
#         "WordCount": 16,
#     #                 'WriteData': '\x30\x08\x33\xb2\xdd\xdd\x01\x41\x11\x11\x22\x22', # XXX allow user-defined pattern
#     }  
#      
#     OpSpecs.append(writeSpecParam)
#     OpSpecs.append(readSpecParam)
     
#     proto.nextAccessSpec(opSpecs = OpSpecs,
#         accessSpec = {'ID':2, 'StopParam': {'AccessSpecStopTriggerType': 1, 'OperationCountValue': 1,},})

def BlockChallengeAccess(pto, arg):

    global OpSpecs, proto, OpSpecsIdx, accessId, wordCnt, hashChecksum
    proto           =  pto
    OpSpecsIdx      = 2
    accessId        = 1
#     wordCnt         = str(int('{:02X}'.format(bytes_per_read)) - 4)

    start_address           = arg['startAddr']
    lengthofFramwork        = arg['LOF']
    ran_num                 = arg['user-RanNum-Att']
    hashChecksum            = generateHashCheckSum(start_address, lengthofFramwork, int(ran_num, 16))
    print hashChecksum
#     wordCnt                 = str(int('{:02X}'.format(lengthofFramwork / bytes_per_read)) - 4)
    OpSpecs                 = []
    
    hexContent = AttesSpecType + lengthofFramwork +  start_address + ran_num
    print ('hex content : ', hexContent)
    OpSpecs.append(getBlockWriteMessage(1, (len(hexContent) / 4), hexContent))
    OpSpecs.append(getReadMessage(11, 4))

    startTimeMeasurement()
    
    print OpSpecs
    
    proto.startAccessSpec(None, opSpecs = [OpSpecs[0], OpSpecs[1]],
        accessSpecParams = {'ID':accessId, 'StopParam': {'AccessSpecStopTriggerType': StopTrigger, 'OperationCountValue': OCV,},})
    
        
def ReadWriteAccess(proto, arg):
    
    readSpecParam       = None
    writeSpecParam      = None
    
    print i2h(int(arg['wordPtr']))
    
    startTimeMeasurement()
    
    if (arg['type'] == 'read'):
        readSpecParam = {
                'OpSpecID': 0,
                'MB': arg['MB'], # EPC=1, Usermem = 3
                'WordPtr': i2h(int(arg['wordPtr'])),
                'AccessPassword': int(arg['accessPwd']),
                'WordCount': int(arg['wordCnt']),
                }
        print ("read Param : ", readSpecParam)
        return proto.startAccessSpec(None ,opSpecs = readSpecParam, # OR you could do: [readSpecParam,readSpecParam2,readSpecParam3],
            accessSpecParams = {'ID':1, 'StopParam': {'AccessSpecStopTriggerType': StopTrigger, 'OperationCountValue': OCV,},})        
            
    elif(arg['type'] == 'write') :
        writeSpecParam = {
            'OpSpecID': 0,
            'MB': int(arg['MB']),
            'WordPtr': int(arg['wordPtr']),
            'AccessPassword': int(arg['accessPwd']),
            'WriteDataWordCount': int(arg['wordCnt']),
#             'WriteData': '\x1900'
            'WriteData': arg['writeData'].decode("hex")
            }
#                 'WriteData': '\x30\x08\x33\xb2\xdd\xdd\x01\x41\x11\x11\x22\x22', # XXX allow user-defined pattern
        
        print ("writeSpecParam : ", writeSpecParam)
#         return proto.startAccess(readWords=None,
#                                 writeWords=writeSpecParam)  
        return proto.startAccess(readWords=None,
            writeWords=[writeSpecParam],accessStopParam = {'AccessSpecStopTriggerType': 1, 'OperationCountValue': 5,})

#     proto.startAccessSpec(None, opSpecs = [OpSpecs[0], OpSpecs[1]],
#                           accessSpecParams = {'ID':accessId, 'StopParam': {'AccessSpecStopTriggerType': StopTrigger, 'OperationCountValue': OCV,},})
    
def generateHashCheckSum(addr, size, ranN) :
    
    f               = open("./hash/hashTest.hex", "rb")
    wispDataLine    = f.readlines()
    data            = ''
    sIdx            = (int(addr, 16) - hashAddr) * 2 # 0x0 === 0x4400
    l               = int(size, 16) * 2
    
    print sIdx, l;
    
    for i in range(0,len(wispDataLine)):
        data += wispDataLine[i]
     
    data = re.sub(r"\s", '', data).lower() # prevent line 
       
    print repr(data)
    
    xtea_hash = xtea_dll.HASH_XTEA_PFMD
    # prepare for the parameters
    text = data[sIdx:sIdx+l].decode("hex")
    print repr(text) 
    nonce = c_uint64(ranN) # 64-bit initial value
    plain_text = create_string_buffer(text, len(text)) # string to byte array
    text_size = c_uint16(len(text));
    final_hash = c_uint64(0) # 64-bit
    
    # call the hash function and get final results
    xtea_hash(nonce, c_void_p(addressof(plain_text)), text_size, c_void_p(addressof(final_hash)))
    hexFinalVal = hex(final_hash.value)
    
    return str(hexFinalVal)[2:len(hexFinalVal)-1].zfill(16)
    
    
def calcChecksum(stork_message):
    checksum = 0
    for i in range(0, len(stork_message),2):
        checksum += int("0x"+ stork_message[i:i+2], 0)
    checksum = checksum % 256
    return "{:04x}".format(checksum)

def recodeCSVdata():
    
    with open('./csv/benchmark.csv', 'wb') as csvfile :
        fieldnames = ['AsscessType', 'WordSize', 'Time']
        writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
        
        writer.writeheader()
        writer.writerow({'AsscessType':'read', 'WordSize':'0x80', 'Time':'10.21'})
        writer.writerow({'AsscessType':'write', 'WordSize':'0xFF', 'Time':'10.21'})
        writer.writerow({'AsscessType':'test', 'WordSize':'0x80', 'Time':'10.21'})


if __name__ == '__main__':
    
    init_logging()
    # Set up tornado to use reactor
    TwistedIOLoop().install()
    
    # Set up web server
    settings = {"debug" : True,''
                "static_path" : os.path.join(pathDir, "static"),
                "template_path" : os.path.join(pathDir, "template")
                }

    application = Application([(r"/", BaseHandler)
                              , (r"/ws", WebSocketHandler)
                              , (r"/upload", UploadFileHandler)
#                               , (r"/pause", PauseHandler)
#                               , (r"/resume", ResumeHandler)
                              ], **settings)
    application.listen(8888)
    
    # Load Sllurp config
    args = parse_args()
    enabled_antennas = map(lambda x: int(x.strip()), args.antennas.split(','))

    # Create Clients and set the0m to connect
    fac = LLRPClientFactory(report_every_n_tags=args.every_n,
                            antennas=enabled_antennas,
                            tx_power=args.tx_power,
                            modulation=args.modulation,
                            tari=args.tari,
                            session=args.session,
                            tag_population=args.population,
                            start_inventory=True,
                            tag_content_selector={
                                'EnableROSpecID': True,
                                'EnableSpecIndex': True,
                                'EnableInventoryParameterSpecID': True,
                                'EnableAntennaID': True,
                                'EnableChannelIndex': True,
                                'EnablePeakRRSI': True,
                                'EnableFirstSeenTimestamp': True,
                                'EnableLastSeenTimestamp': True,
                                'EnableTagSeenCount': True,
                                'EnableAccessSpecID': True,
                                })
    
    fac.addTagReportCallback(tag_seen_callback)

    for host in args.host:
        reactor.connectTCP(host, args.port, fac, timeout=3) #@UndefinedVariable
        
    reactor.addSystemEventTrigger('before', 'shutdown', polite_shutdown, fac) #@UndefinedVariable
 
    # Start server & connect to readers
    reactor.run() #@UndefinedVariable
    
