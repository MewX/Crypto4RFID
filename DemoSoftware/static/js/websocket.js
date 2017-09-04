		$(document).ready(function() {
		    if (!window.console) window.console = {};
		    if (!window.console.log) window.console.log = function() {};
		    
		    $("#pauseForm").on("submit", function() {
		       window.ws.send(JSON.stringify("pause"));
		        return false;
		    });
		    
		    $("#resumeForm").on("submit", function() {
		    	window.ws.send(JSON.stringify("resume"));
		        return false;
		    });
		    
		    $("#readForm").on("submit", function() {
		    	window.ws.send(JSON.stringify("status"));
		        return false;
		    });
		    
		});

		var tagAttributes = [ 'EPC-96', 'ROSpecID', 'SpecIndex',
				'InventoryParameterSpecID', 'AntennaID', 'ChannelIndex',
				'PeakRSSI', 'FirstSeenTimestampUTC', 'LastSeenTimestampUTC',
				'TagSeenCount', 'AccessSpecID' ];
		
//		var buttonInfo = new Object();
//		buttonInfo.resume = "";
//		buttonInfo.pause = "";
//		buttonInfo.read = "";
//		buttonInfo.write = "";
		
		if (window.WebSocket) {
			var loc = document.location.toLocaleString(), 
				start = loc.indexOf('://') + 3, 
				end = loc.lastIndexOf('/'), 
				host = loc	.slice(start, end), 
				wsPath = 'ws://' + host + '/ws';
			
			window.ws = new WebSocket(wsPath);
			ws.onopen = function() {
				console.log('websocket connected');
			};
			ws.onmessage = handleMessage;
		} else {
			alert('This demo only works with browsers that support WebSocket.');
		}		
		
		function handleMessage(evt) {
			var data = JSON.parse(evt.data), tags = data.tags, tbody = document
					.getElementById('tagData'), rowData = '', i, tag, ai, row;

			for (i in tags) {
				tag = tags[i];
				row = document.getElementById(tag['EPC-96'])
				if (!row) {
					row = document.createElement("tr")
					row.id = tag['EPC-96']
					tbody.appendChild(row)
				}

				rowData = ''
				for (ai in tagAttributes) {
					rowData += createCell(tag, tagAttributes[ai])
				}
				row.innerHTML = rowData;
			}
		}

		function createCell(tag, attribute) {
			var value = tag[attribute] ? tag[attribute] : '';
			if (value && value instanceof Array) {
				value = value.join(', ')
			}
			if (value && attribute == 'FirstSeenTimestampUTC'
					|| attribute == 'LastSeenTimestampUTC') {
				value = new Date(value / 1000).toLocaleString();
			}

//			if (attribute == "EPC-96") {
//				return '<td><input type="text" value=' + value + '></td>';
//			} else {}
			return '<td>' + value + '</td>';
		}


		
