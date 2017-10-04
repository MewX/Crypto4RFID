		var tagAttributes = [ 'EPC-96', 'ROSpecID', 'SpecIndex',
				'InventoryParameterSpecID', 'AntennaID', 'ChannelIndex',
				'PeakRSSI', 'FirstSeenTimestampUTC', 'LastSeenTimestampUTC',
				'TagSeenCount', 'AccessSpecID' ];
		
		var readTagAttributes = [ 'EPCvalue', 'read', 'memroybank'];
		
		var readWisTagAttributes = ['readWisp'];
		
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
			var data = JSON.parse(evt.data)
				, tags = data.tags
				, readTags = data.readTags
				, readWispTags = data.readWispTags
				, tbody = document.getElementById('tagData')
				, tbody2 = document.getElementById('readData')
				, tbody3 = document.getElementById('readWispData')
				, rowData = ''
				, readRowData = ''
				, readWispRowData = ''
				, i, tag, ai, row
				, j, readTag, aj, Readrow
				, k, readWipsTag, ak, ReadWispRow;
			
			for (i in tags) {
				tag = tags[i];
				row = document.getElementById(tag['EPC-96'])
				if (!row) {
					row = document.createElement("tr")
					row.id = tag['EPC-96']
					tbody.appendChild(row)
				}

				rowData = ''
				rowData += '<td><input type="checkbox" class="row-check"/></td>'
				for (ai in tagAttributes) {
					rowData += createCell(tag, tagAttributes[ai])
				}
				row.innerHTML = rowData;
			}
			
			// read table
			for (j in readTags){
				readTag = readTags[j];
				Readrow = document.getElementById("read-" + readTag['EPCvalue'])
				
				if (!Readrow) {
					Readrow = document.createElement("tr")
					Readrow.id = "read-" + readTag['EPCvalue']
					tbody2.appendChild(Readrow)
				}
				
				readRowData = ''
				
				for (aj in readTagAttributes) {
					readRowData += createCell(readTag, readTagAttributes[aj])
				}
				Readrow.innerHTML = readRowData;
			}
			
			
			// read Wisp table
			for (k in readWispTags){
				readWipsTag = readWispTags[k];
				ReadWispRow = document.getElementById("readWisp-" + readWipsTag['EPCvalue'] + "-" + readWipsTag['OpSpecId'])
				
				if (!ReadWispRow) {
					ReadWispRow = document.createElement("tr")
					ReadWispRow.id = "readWisp-" + readWipsTag['EPCvalue'] + "-" + readWipsTag['OpSpecId']
					tbody3.appendChild(ReadWispRow)
				}
				
				readWispRowData = '';
				for (ak in readWisTagAttributes) {
					readWispRowData += createCell(readWipsTag, readWisTagAttributes[ak])
				}
				ReadWispRow.innerHTML = readWispRowData;
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
			if (attribute == 'memroybank'){
				value = $('input[name=optradio]:checked').attr('id');
			}
			
//			if (attribute == "EPC-96") {
//				return '<td><input type="text" value=' + value + '></td>';
//			} else {}
			return '<td>' + value + '</td>';
		}


		
