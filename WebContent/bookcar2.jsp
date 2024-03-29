<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        
<%@ page import="com.mongodb.DBObject, com.mongodb.DB, com.mongodb.DBCursor, com.mongodb.DBObject, com.mongodb.BasicDBObject, com.mongodb.DBCollection,  com.mongodb.MongoClient, com.mongodb.MongoCredential, com.mongodb.client.MongoCollection, com.mongodb.client.MongoDatabase,
com.mongodb.client.FindIterable, org.bson.Document, java.util.Date, java.text.SimpleDateFormat,
com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException, java.text.DateFormat, java.util.Iterator" %>
<!DOCTYPE html>
<html>
<head>
	<title>Add car page</title>
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
    <th>Brand</th>
    <th>Description</th>
    <th>Seating</th>
    <th>Rent per day</th>
  </tr>
<% 
//All the car details in the database is being retrieved and the dates are being saved as session for further use
String tripstart = request.getParameter("tripstart");
session.setAttribute("tripstart", tripstart);
String tripend = request.getParameter("tripend");
session.setAttribute("tripend", tripend);
int seat=Integer.parseInt(request.getParameter("seat"));

MongoClient mongo = new MongoClient( "localhost" , 27017 ); 

DB db = mongo.getDB("whitepanda");
DBCollection collection = db.getCollection("cars");
BasicDBObject getQuery = new BasicDBObject();
getQuery.put("seatingcapacity", new BasicDBObject("$gt", (seat-1)));
//only if seating capacity matches they are retrieved
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
    DBCollection ncollection = db.getCollection("booking");
    BasicDBObject ngetQuery = new BasicDBObject();
    ngetQuery.put("carid", carid);
    DBCursor ncursor = ncollection.find(ngetQuery);
    /Checking if the cars are already in the booking table
    while(ncursor.hasNext())
    {
    	DBObject obj1=ncursor.next();
        String sdate = (String)obj1.get("startdate");
        String edate = (String)obj1.get("enddate");
        SimpleDateFormat curFormater = new SimpleDateFormat("yyyy-mm-dd"); 

        Date ssdate = null;
        Date eedate=null;
        Date or=null;
       
        try {
		 ssdate = curFormater.parse(sdate);
	       eedate = curFormater.parse(edate);
	       or = curFormater.parse(tripstart);
	        
        }
        catch (ParseException e) {
	        // TODO Auto-generated catch block
	        e.printStackTrace();
	    } 
    	 //if the dates of the current booking falls anywhere in between already booked dates then the car is not shown else it is displayed
    	if(or.after(ssdate) && or.before(eedate))
    	{
    		System.out.println(or);
    		
    		System.out.println(or.before(eedate));
    		k=1;
    		break;
    	}
    }
    
    if(k==1)
    {
    	continue;
    }
   




%>
<tr>
<td><%out.println(carid);%></td><td><%out.println(brand); %></td><td><%out.println(d); %></td><td><%out.println(seatc); %></td><td><%out.println(rpd); %></td></tr>

<%
}
 %>
 </table>
<form action="bookcar3.jsp" method="post">
	<!-- the car id of the car user would like to book and the customer details is being retrieved after that information is being send to bookcar3.jsp -->
<div>
<label> Enter car id from above table which you wish to book:</label><br>
		<input type="text" name="cid"></div>
		<div>
<label> Name</label><br>
		<input type="text" name="name"></div>
		<div>
<label> Address:</label><br>
		<input type="text" name="ad"></div>
		<div>
<label> Mobile number:</label><br>
		<input type="text" name="mbn"></div>
		<br><input type="submit" value="BOOK" class="button" ><br><br>

</form>

<br>
</div>

  
</body>
</html>
