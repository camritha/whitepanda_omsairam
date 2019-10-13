<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        
<%@ page import="com.mongodb.DBObject, com.mongodb.DB, com.mongodb.DBCursor, com.mongodb.DBObject, com.mongodb.BasicDBObject, com.mongodb.DBCollection,  com.mongodb.MongoClient, com.mongodb.MongoCredential, com.mongodb.client.MongoCollection, com.mongodb.client.MongoDatabase,
com.mongodb.client.FindIterable, org.bson.Document, java.util.Date, java.text.SimpleDateFormat,
com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException, java.text.DateFormat, java.util.Iterator" %>
<!DOCTYPE html>
<html>
<head>
	<title>view car</title>
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
			table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
		
	</style>
</head>
<body><div class="mm"><br><h1>
	 BOOK YOUR CAR AND GO!
</h1></div><br>
<div class="sidenav">
	<img src="D:/whitepanda_omsairam/icon.jpg" alt="pic not found">
  <a href="addcar.html" >ADD CAR</a>
  <a href="bookcar.jsp">BOOK CAR</a>
  <a href="viewcar.jsp">VIEW CAR</a>
 <a href="deletecar.jsp">DELETE CAR</a>
</div>

<div class="main">

<table>
  <tr>
    <th>ID</th>
    <th>Model</th>
    <th>Description</th>
    <th>Seating</th>
    <th>Rent per day</th>
    
  </tr>
<% 

String model=request.getParameter("model");

MongoClient mongo = new MongoClient( "localhost" , 27017 ); 

DB db = mongo.getDB("whitepanda");
DBCollection collection = db.getCollection("cars");
BasicDBObject getQuery = new BasicDBObject();
getQuery.put("brand", model);
DBCursor cursor = collection.find(getQuery);
int k=0;
while(cursor.hasNext())
{
	k=0;
    DBObject obj=cursor.next();
    int carid = (int)obj.get("carid");
    String brand = (String)obj.get("brand");
    int seatc = (int)obj.get("seatingcapacity");
    String d = (String)obj.get("description");
    int rpd = (int)obj.get("rentperday");
    




%>
<tr>
<td><%out.println(carid);%></td><td><%out.println(brand); %></td><td><%out.println(d); %></td><td><%out.println(seatc); %></td><td><%out.println(rpd); %></td><td>

<%
DBCollection ncollection = db.getCollection("booking");
BasicDBObject ngetQuery = new BasicDBObject();
ngetQuery.put("carid", carid);
DBCursor ncursor = ncollection.find(ngetQuery);
%>

<table>
  <tr>
  
    <th>CUSNAME</th>
    <th>CUSADDRESS</th>
    <th>STARTDATE</th>
    <th>ENDDATE</th>
    
 </tr>
  <%

while(ncursor.hasNext())
{
	DBObject obj1=ncursor.next();
    String sdate = (String)obj1.get("startdate");
    String edate = (String)obj1.get("enddate");
    String cusname = (String)obj1.get("cusname");
    String cusaddress = (String)obj1.get("cusaddress");
    %>
    <tr>
<td><%out.println(cusname); %></td><td><%out.println(cusaddress); %></td><td><%out.println(sdate); %></td><td><%out.println(edate); %></td></tr>
    
<%
}
  
 %>
 </table>
 </td>
 </tr>
 <% 
}
 %>
 </table>

<br>
</div>

  
</body>
</html>