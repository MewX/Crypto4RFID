/**
 * 
 */

if(window.WebSocket){
    var loc = document.location.toLocaleString(),
    start = loc.indexOf('://') + 3,
    end = loc.lastIndexOf('/'),
    host = loc.slice(start, end),
    wsPath = 'ws://' + host + '/ws';
    window.ws = new WebSocket(wsPath);
    ws.onopen = function() {
        console.log('websocket connected');
    };
    ws.onmessage = handleMessage;
} else {
    alert('This demo only works with browsers that support WebSocket.');
}