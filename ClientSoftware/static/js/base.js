$(document).ready(function() {
	
	var mode = true;
	
	$('#RFID-mode').change(function() {
      mode = $(this).prop('checked');
    })
    
    $("#pauseForm").on("submit", function() {
    	window.ws.send(JSON.stringify({"type":"pause"}));
        return false;
    });
    
    $("#resumeForm").on("submit", function() {
    	window.ws.send(JSON.stringify({"type":"resume"}));
        return false;
    });
    
    $("#readForm").on("submit", function() {
    	var MB = $('input[name=optradio]:checked' ).val();
    	var WordSta = $('#WordStart').val();
    	var WordCnt = $('#WordCnt').val();
    	var AcessPwd = $('#AcessPwd').val();
    	window.ws.send(JSON.stringify({"type":"read"
    										, "MB": MB
    										, "wordPtr": WordSta    										
    										, "accessPwd": AcessPwd  
    										, "wordCnt": WordCnt}));
        return false;
    });
    
    $("#writeForm").on("submit", function() {
        	var MB = "1";
        	var WordSta = "2";
        	var WordCnt = "6";
        	var AcessPwd = "0";
        	var WriteData = $('#WriteData').val();
        	
        	window.ws.send(JSON.stringify({"type":"write"
        										, "MB": MB
        										, "wordPtr": WordSta    										
        										, "accessPwd": AcessPwd  
        										, "wordCnt": WordCnt    										
        										, "writeData": WriteData}));
        	window.location = "/";
        	return false;
    });

    $("#writeForm-wisp").on("submit", function() {
    	var fileName = $("#status").text().split(": ");
    	window.ws.send(JSON.stringify({"type":"writeWisp"
    										, "file": fileName[1]}));
    	return false;
    });    
    
    $("#readForm-wisp").on("submit", function() {
    	
    	var readWispBody = document.getElementById('readWispData');
    	readWispBody.innerHTML = '';
    	
    	var startAddr = $("#user-StartAddr").val();
    	var endAddr = $("#user-EndAddr").val();
    	
    	window.ws.send(JSON.stringify({"type":"readWisp"
											, "startAddr": startAddr    										
											, "endAddr": endAddr}));
    	return false;
    	
    });
    
    $("#hexfile-upload").on("submit", function(){
	    	var formData = new FormData($(this)[0]);
	    	$.ajax({
	    		url: "/upload",
	    		type: "POST",
	    		data:formData,
	    		contentType:false,
	    		processData:false,
	    		cache:false,
	    		success:function(data){
	    			var submitButton = '<span id="status" class="label label-default">'
	    								+ data 
	    								+'</span><button class="btn btn-warning" type="submit">Start to Write</button>';
	    			$("#upload-status").html(submitButton);
	    		},
	    		error:function(data){
	    			$("#upload-status").html(data);
	    		},
	    		xhr:function(){
	    			myXhr = $.ajaxSettings.xhr();
	                if(myXhr.upload){
	                    myXhr.upload.addEventListener('progress',handleProgress,false);
	                	}
	                return myXhr;
	    		}
	    	});
	    	
	    	$("#upload-status").html('File is being uploaded...');
	    	return false
    });
    
    handleProgress = function(evnt){
        if(evnt.lengthComputable){
            var ratio = (evnt.loaded / evnt.total) * 100;
            $('progress').attr({value:ratio})
        }
    };
    
    $("#testForm").on("submit", function() {
    	window.ws.send(JSON.stringify({"type":"test"}));
        return false;
    });
    
    $("#readEPCbtn").click(function(){
    	var row = $('table#inventory').find('tbody').find('tr');
    	var epcValue = "";
    	for(var i=0; i<row.length; i++){
    		epcValue = $(row[i]).find('td:eq(1)').html(); 
    	}
    	$('#ReadEPCdata').val(epcValue);
    	$('#WriteData').val(epcValue);
    });
    
    $("#readBtn").click(function(){
    	if(mode){
    		$("#readDiv").slideToggle("slow");
    	}else{
    		$("#readWispDiv").slideToggle("slow");
    	}
    });
    
    $("#writeBtn").click(function(){
    	if(mode){
    		$("#writeDiv").slideToggle("slow");
    	}else{
    		$("#writeWispDiv").slideToggle("slow");
    	}
    });
    
    $(':file').on('fileselect', function(event, numFiles, label) {
        var input = $(this).parents('.input-group').find(':text'),
            log = numFiles > 1 ? numFiles + ' files selected' : label;
        if( input.length ) {
            input.val(log);
        } else {
            if( log ) alert(log);
        }

    });
    
});

// We can attach the `fileselect` event to all file inputs on the page
$(document).on('change', ':file', function() {
  var input = $(this),
      numFiles = input.get(0).files ? input.get(0).files.length : 1,
      label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
  input.trigger('fileselect', [numFiles, label]);
});