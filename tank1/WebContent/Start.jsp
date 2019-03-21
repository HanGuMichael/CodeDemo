<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="Start.css" />
<title>Start</title>
</head>
<body>

<% String username = (String)request.getAttribute("username"); %>

	<div id="all">	
	  <div class="container">
	   
	    <div id ="colorSelect">
	     Tank Color
	    <br/>
	    <br/>
		    <input id = "red" type="radio" name="color" value="red" style="display: none" > Red<br>
	  		<input id = "green" type="radio" name="color" value="green" style="display: none"> Green<br>
	  	    <input id = "blue" type="radio" name="color" value="blue" style="display: none" > Blue<br>
	  	    <h2 id="nosignin" style="display: none" >You are not signed in.</h2>  
  	    </div>
  	    
  	    <br/>
  	    
	    <button onClick="findGame()">Find Game</button>
	    
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	    
	    <script>
	    var username = "<%= username%>"; 
	    console.log(username);
	    var red = document.getElementById("red");
	    var blue = document.getElementById("blue");
	    var green = document.getElementById("green");
	    var nosignin = document.getElementById("nosignin");
	    if(username=="null"){
	    	nosignin.style.display = 'block';
	    }else{
	    	
	    	red.style.display = 'block';
	    	green.style.display = 'block';
	    	blue.style.display = 'block';
	    	
	    	
	    }
	    
	    function findGame(){
	    	connectToServer();
	    }
	    
	    var socket;
	    
    	function connectToServer() {
    		socket = new WebSocket("ws://localhost:8080/tank1/ms");
    		socket.onopen = function(event) {
    			console.log("Connected");
    			//document.getElementById("mychat").innerHTML += "Connected!";
    			
    		}
    		socket.onmessage = function(event) {
    			console.log(event.data);
    			var str = event.data;
    			var spl = str.split("#");
    			
    			//request.getSession().setAttribute("room",spl[0]);
    			/*
    			$.ajax({
    				url: "startToTank",
    				data:{
    					room: spl[0],
    					position: spl[1]
    				},
    				success: function(result){
    					
    				}
    			});
    			*/
    			//request.getSession().setAttribute("position",spl[1]);
    			//console.log(spl[0]);
    			location.href = "startToTank?room="+ spl[0] +"&position="+spl[1];
    		}
    		socket.onclose = function(event) {
    			//document.getElementById("mychat").innerHTML += "Disconnected!";
    		}
    	}
    	function sendMessage() {
    		//socket.send("Miller: " + document.chatform.message.value);
    		
    	}
	    </script>
	    <button onclick="location.href='Login.jsp'" type="button">Log Out / Quit</button>
	
	  </div>

	</div>
</body>
</html>