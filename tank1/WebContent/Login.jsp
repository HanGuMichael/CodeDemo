<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="Login.css" />
<title>Login</title>
</head>

<script>
	function LogIn() {
		//console.log("A");
	  	var request = "Validate?";
		request += "username=" + document.login.uname.value;
		request += "&password=" + document.login.psw.value;
		
		console.log(request);
		var xhttp = new XMLHttpRequest();
		xhttp.open("GET", request, true);
		xhttp.send();
	}
	
	
</script>
<style>
#example1 {
    border: 100px ;
    background:url(background.jpg);
    margin: 10 px;
    background-size: 1250px 1250px;
    background-repeat: no-repeat;
    padding:475px;
}
</style>

<body>

	<div id="all">	
	<form name = "login" action ="Validate">
	  <div class="container">
	    <label for="uname"><b></b></label>
	    <input type="text" placeholder="Enter Username" name="uname">
	
	    <label for="psw"><b></b></label>
	    <input type="password" placeholder="Enter Password" name="psw">
	        
	    <button type="submit">Log In</button>
	    <button onclick="location.href='Account.jsp'" type="button">Create Account</button>
	    <button onclick="location.href='Start.jsp?username=guest'" type="button">Play As Guest</button>
	    
		</div>

	</form>

	</div>
</body>
</html>