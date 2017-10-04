import sys
import os
from joblib.logger import pformat
import binascii
import pprint
import sllurp
sys.path.append(os.path.abspath(os.path.join(__file__, '..', '..', '..')))

from argparse import ArgumentParser
from logging import getLogger, INFO, Formatter, StreamHandler, WARN
from sllurp.llrp import LLRP_PORT, LLRPClientFactory, LLRPClient
import smokesignal
from tornado.escape import json_decode
from tornado.platform.twisted import TwistedIOLoop
from tornado.web import RequestHandler, Application
from tornado.websocket import WebSocketClosedError, WebSocketHandler
from twisted.internet import reactor, defer
import time


from sllurp.WControlModules import WiRead

from sllurp.WModules import AccessSpecFactory as ASF, h2i, i2h

'''
Sllurp/Tornado
This file contains an example showing how to use Sllurp with Tornado
to update a web page via websockets when rfid tags are seen.
'''

# WISP Control global variables.
fac                 = None
proto               = None
tagReport = 0

#parameters
bytes_per_read = 0x20
wordCnt = str(int('{:02X}'.format(bytes_per_read)) - 4)
accessType = ''
accessId = 1;
OCV = 1
StopTrigger = 1
OpSpecs = []
OpSpecsIdx = 2



logger = getLogger('Wsllurp')

def setup_logging():
    logger.setLevel(INFO)
    logFormat = '%(asctime)s %(name)s: %(levelname)s: %(message)s'
    formatter = Formatter(logFormat)
    handler = StreamHandler()
    handler.setFormatter(formatter)
    logger.addHandler(handler)

    stream_handler_warn = StreamHandler()
    stream_handler_warn.setLevel(WARN)
    stream_handler_warn.setFormatter(formatter)

    access_log = getLogger("tornado.access")
    access_log.addHandler(stream_handler_warn)
    app_log = getLogger("tornado.application")
    app_log.addHandler(handler)

    gen_log = getLogger("tornado.general")
    gen_log.addHandler(handler)


class BaseHandler(RequestHandler):
    def get(self):
        self.render("base.html")

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

def tag_seen_callback(llrpMsg):
    
        """Function to run each time the reader reports seeing tags."""
        global tagReport, accessId, OpSpecsIdx
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
                        if ("ReadData" in tag["OpSpecResult"][ops]):
                            logger.info("Readdata = " + tag["OpSpecResult"][ops]["ReadData"])
                            if (accessType == 'readWisp') :
                                if(OpSpecsIdx < OpSpecs.__len__()) :
                                    accessId += 1
                                    proto.startAccessSpec(None, opSpecs = [OpSpecs[OpSpecsIdx], OpSpecs[OpSpecsIdx+1]],
                                        accessSpecParams = {'ID':accessId, 'StopParam': {'AccessSpecStopTriggerType': StopTrigger, 'OperationCountValue': OCV,},})
                                    OpSpecsIdx += 2
                                    
                                smokesignal.emit('rfid', {
                                    'readWispTags': [{'readWisp' : tag["OpSpecResult"][ops]["ReadData"]
                                                      , 'EPCvalue' : tag["EPC-96"]
                                                      , 'OpSpecId' : tag["OpSpecResult"][ops]["OpSpecID"] }],})                                     

                            else :
                                smokesignal.emit('rfid', {
                                    'readTags': [{'read' : tag["OpSpecResult"][ops]["ReadData"]
                                                , 'EPCvalue' : tag["EPC-96"] }],}) 
#                             for ops in tags["OpSpecResult"].values():
#                                 logger.info(ops["ReadData"]);
#                                 if(ops["ReadData"][-2:] == "ff"):
#                                     polite_shutdown(fac)
                else:
                    logger.info('no tags seen')
                return
            for tag in tags:
                tagReport += tag['TagSeenCount'][0]       

#         if tags:
#             smokesignal.emit('rfid', {
#                 'tags': tags,
#             })            
#         for tag in tags:
#             if "OpSpecResult" in tag:
#                 data = tag["OpSpecResult"].get("ReadData")
#                 print ('OpSpecResult : ', data)
#                 if data:
#                     if sys.version_info.major < 3:
#                         sys.stdout.write(data)
#                     else:
#                         sys.stdout.buffer.write(data)                     # bytes
#                     logger.debug("hex data: %s", binascii.hexlify(data))                    
                

            

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
    if(arg['type'] == 'readWisp'):
        for pto in fac.protocols: 
            BlockReadAccess(pto, arg)
    else :
        for pto in fac.protocols: 
            ReadWriteAccess(pto, arg)


def getBlockWriteMessage(OpSpecID, content):
    hexContent = wordCnt + '{:02X}'.format(bytes_per_read) + content
    print ("hexContent ", hexContent)
    
    write_message = {
        'OpSpecID': OpSpecID,
        'MB': 3,
        'WordPtr': 0,
        'AccessPassword': 0,
        'WriteDataWordCount': 2,
        'WriteData': hexContent.decode('hex'),
    }
    print (write_message)
    return write_message 

def getReadMessage(OpSpecID):
    read_message = {
        'OpSpecID': OpSpecID,
        "MB": 3, # EPC = 1 user memory = 3
        "WordPtr": 0,
        "AccessPassword": 0,
        "WordCount": wordCnt,
    }
    print (read_message)
    
    return read_message 

def BlockReadAccess(pto, arg):
    
    global OpSpecs, proto
    proto =  pto
    
    start_address = int(arg['startAddr'], 16)
    end_address = int(arg['endAddr'], 16)
    OpSpecs = []
    cnt = 1
    for i in range(start_address, end_address, bytes_per_read):
        print i2h(i)
        OpSpecs.append(getBlockWriteMessage(cnt, i2h(i)))
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
#     readSpecParam = {
#         'OpSpecID': 11,
#         "MB": 3, # EPC = 1 user memory = 3
#         "WordPtr": 0,
#         "AccessPassword": 0,
#         "WordCount": 16,
#     }
     
    print OpSpecs.__len__()
     
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
        
def ReadWriteAccess(proto, arg):
    
    start = time.time()
    
    readSpecParam = None
    writeSpecParam = None
    
    print i2h(int(arg['wordPtr']))
    
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
            accessSpecParams = {'ID':1, 'StopParam': {'AccessSpecStopTriggerType': 1, 'OperationCountValue': 1,},})        
            
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
    
def calcChecksum(stork_message):
    checksum = 0
    for i in range(0, len(stork_message),2):
        checksum += int("0x"+ stork_message[i:i+2], 0)
    checksum = checksum % 256
    return "{:02x}".format(checksum)

if __name__ == '__main__':
    setup_logging()
    # Set up tornado to use reactor
    TwistedIOLoop().install()
    
    # Set up web server
    settings = {"debug" : True,''
                "static_path" : os.path.join(os.path.dirname(__file__), "static"),
                "template_path" : os.path.join(os.path.dirname(__file__), "template")
                }

    print os.path.join(os.path.dirname(__file__), "static")

    application = Application([(r"/", BaseHandler)
                              , (r"/ws", WebSocketHandler)
#                               , (r"/pause", PauseHandler)
#                               , (r"/resume", ResumeHandler)
                              ], **settings)
    application.listen(8888)
    
    # Load Sllurp config
    args = parse_args()
    enabled_antennas = map(lambda x: int(x.strip()), args.antennas.split(','))

    # Create Clients and set them to connect
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
        
#     fac.addStateCallback(LLRPClient.STATE_INVENTORYING, readAccess)
    reactor.addSystemEventTrigger('before', 'shutdown', polite_shutdown, fac) #@UndefinedVariable
 
    # Start server & connect to readers
    reactor.run() #@UndefinedVariable
    
