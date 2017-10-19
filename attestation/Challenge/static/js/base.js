$(document).ready(function() {
    
    $("#pauseForm").on("submit", function() {
       window.ws.send(JSON.stringify("pause"));
        return false;
    });
    
    $("#resumeForm").on("submit", function() {
    	window.ws.send(JSON.stringify("resume"));
        return false;
    });
    
    $("#readForm").on("submit", function() {
    	window.ws.send(JSON.stringify("read"));
        return false;
    });
    
    $("#writeForm").on("submit", function() {
    	window.ws.send(JSON.stringify("write"));
    	window.location = "/";
        return false;
    });
    
    $("#readBtn").click(function(){
//    	$("#readDiv").slideToggle("slow");
    	$("#readWispDiv").slideToggle("slow");
    });
    
    $("#writeBtn").click(function(){
//    	$("#writeDiv").slideToggle("slow");
    	$("#writeWispDiv").slideToggle("slow");
    });
});