<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>book car page</title>
	<style>
		body{
			margin:0px;
		}
		.sidenav {
			
  			height: 100%;
 			width: 200px;
  			position: fixed;
  			z-index: 1;
  			top: 0;
  			left: 0;
  			background-color:black;
  			overflow-x: hidden;
  			padding-top: 0px;
  			color:white;
		}

		.sidenav a {
  			padding: 6px 8px 6px 16px;
  			text-decoration: none;
  			font-size: 25px;
  			color: white;
  			display: block;
  			border: 2px solid #A4123F;
		}

		.sidenav a:hover {
			transition-duration: 0.35s;
  			color: #f1f1f1;
  			font-size:30px;
		}
		.main {
			margin-top:130px;
  			margin-left: 220px; /* Same as the width of the sidenav */
  			font-size: 28px; /* Increased text to enable scrolling */
  			padding: 0px 10px;
		}
		.mm{
			height:130px;
			position:fixed;
			width:100%;
			background-color: black;
			text-align:center;
			margin:0px;
			color:white;
		}
		body{
			font-family: sans-serif;
		}
		input[type=text],input[type=password],input[type=email],input[type=number]{
			width: 50%;
  			padding: 12px 20px;
  			margin: 8px 0;
  			box-sizing: border-box;
  			border: 3px solid #ccc;
  			border-radius:4px;
  			outline:none;
  			-webkit-transition: 0.5s;
 			transition: 0.5s;
		}
		input[type=password]:focus{
			border:3px solid #555;
		}
		input[type=text]:focus{
			border:3px solid #555;
		}
		.fieldset{
			margin-left: 20%;
			margin-right: 20%;
			border-radius: 4px;
			border:2px solid black;
		}
		.hh{
			background-color:black;
			color:white;

		}
		.form{
			background-color:black;
		}
		.button {
  			background-color: #4CAF50; /* Green */
  			border: none;
  			color: white;
  			padding: 15px 32px;
  			text-align: center;
  			width:110px;
  			display: inline-block;
  			font-size: 16px;
  			margin: 4px 2px;
  			border-radius: 5px;
  			transition-duration: 0.4s;
		}
		.button:hover{
			background-color:gray;
		}
		
	</style>
</head>
<body><div class="mm"><br><h1>
	 BOOK YOUR CAR AND GO!
</h1></div><br>
<div class="sidenav">
	<img src="C:/Users/Amritha Giri/Desktop/icon.jpg" alt="pic not found">
  <a href="addcar.html" >ADD CAR</a>
  <a href="bookcar.jsp">BOOK CAR</a>
  <a href="viewcar.jsp">VIEW CAR</a>
 <a href="deletecar.jsp">DELETE CAR</a>
</div>

<div class="main">
	<div class="fieldset" align="center">
<h3>Book car</h3><br>
<form action="bookcar2.jsp" method="post">
		<div>
			<div style="fontsize:10px;">You can only book from morning 6am to next day morning 5am No changes</div><br>
		<label> From date </label><br>
		<input type="date" id="start" name="tripstart" value="2019-07-22"
       min="2019-01-01" max="2019-12-31"></div>
		<div>
		<br><label> End date (not including that day)</label><br>
		<input type="date" id="end" name="tripend" value="2019-07-23"
       min="2019-01-01" max="2019-12-31"></div>
		
		<br><div>
		<label> seating </label><br>
		<input type="text" name="seat"></div><br>
		<br><input type="submit" value="SEARCH" class="button" ><br><br>

</form>
</div>
</div>
  
</body>
</html>