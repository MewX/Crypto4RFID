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
        	var MB = "3";
        	var WordSta = "0";
        	var WordCnt = ($('#WriteData-wisp').val().length)/4;
//        	var WordCnt = "2";
        	var AcessPwd = "0";
        	var WriteData = $('#WriteData-wisp').val();
        	
        	window.ws.send(JSON.stringify({"type":"write"
        										, "MB": MB
        										, "wordPtr": WordSta    										
        										, "accessPwd": AcessPwd  
        										, "wordCnt": WordCnt    										
        										, "writeData": WriteData}));    	
        	window.location = "/";
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
    	$("#readDiv").slideToggle("slow");
//    	$("#readWispDiv").slideToggle("slow");
    });
    
    $("#writeBtn").click(function(){
    	if(mode){
    		$("#writeDiv").slideToggle("slow");
    	}else{
    		$("#writeWispDiv").slideToggle("slow");
    	}
    });
});