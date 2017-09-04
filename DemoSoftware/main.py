import sys
import os
from sympy.logic.boolalg import false
import tornado
from sllurp.access import fac
from joblib.logger import pformat
sys.path.append(os.path.abspath(os.path.join(__file__, '..', '..', '..')))

from argparse import ArgumentParser
from logging import getLogger, INFO, Formatter, StreamHandler, WARN
from sllurp.llrp import LLRP_PORT, LLRPClientFactory
import smokesignal
from tornado.escape import json_decode
from tornado.platform.twisted import TwistedIOLoop
from tornado.template import Loader
from tornado.web import RequestHandler, Application, StaticFileHandler
from tornado.websocket import WebSocketClosedError, WebSocketHandler
from twisted.internet import reactor

'''
Sllurp/Tornado Example
This file contains an example showing how to use Sllurp with Tornado
to update a web page via websockets when rfid tags are seen.
'''

fac                 = None

logger = getLogger('sllurp')


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
        tags = llrpMsg.msgdict['RO_ACCESS_REPORT']['TagReportData']
        if tags:
            smokesignal.emit('rfid', {
                'tags': tags,
            })


def parse_args():
    parser = ArgumentParser(description='Simple RFID Reader Inventory')
    parser.add_argument('host', help='hostname or IP address of RFID reader', nargs='*')
    parser.add_argument('-p', '--port', default=LLRP_PORT, type=int, help='port to connect to (default {})'.format(LLRP_PORT))
    parser.add_argument('-n', '--report-every-n-tags', default=1, type=int, dest='every_n', metavar='N', help='issue a TagReport every N tags')
    parser.add_argument('-a', '--antennas', default='1', help='comma-separated list of antennas to enable')
    parser.add_argument('-X', '--tx-power', default=0, type=int, dest='tx_power', help='Transmit power (default 0=max power)')
    parser.add_argument('-M', '--modulation', default='M8', help='modulation (default M8)')
    parser.add_argument('-T', '--tari', default=0, type=int, help='Tari value (default 0=auto)')
    return parser.parse_args()

#Reader Operation Control
def reader_control(arg):
    if arg == 'resume':
        fac.resumeInventory()
    elif arg == 'pause':
        fac.pauseInventory()
    elif arg == 'status':
        fac.getProtocolStates()

def polite_shutdown(factory):
    return factory.politeShutdown()

if __name__ == '__main__':
    setup_logging()
    # Set up tornado to use reactor
    TwistedIOLoop().install()

    # Set up web server
    settings = {"debug" : True,
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

         
