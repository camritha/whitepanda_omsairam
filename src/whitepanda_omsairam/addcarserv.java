package whitepanda_omsairam;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.bson.Document;

import com.mongodb.MongoClient;
import com.mongodb.MongoCredential;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;

/**
 * Servlet implementation class addcarserv
 */
@WebServlet("/addcarserv")
public class addcarserv extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addcarserv() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	
	//through get method the data entered in the form is passed on to this method for insertion
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		//The data about car details from user 
		 int carid=Integer.parseInt(request.getParameter("id"));
		 String name=request.getParameter("name");
		 String desc=request.getParameter("desc");
		 String vn=request.getParameter("vn");
		 int rpd=Integer.parseInt(request.getParameter("rpd"));
		 int seat=Integer.parseInt(request.getParameter("seat"));
		 MongoClient mongo = new MongoClient( "localhost" , 27017 ); 

		      // Creating Credentials 
	        
	      MongoCredential credential; 
	      credential = MongoCredential.createCredential("sampleUser", "whitepanda", 
	         "password".toCharArray()); 
	      System.out.println("Connected to the database successfully");  
	      
	      // Accessing the database 
	      MongoDatabase database = mongo.getDatabase("whitepanda"); 

	      // Retrieving a collection
	      MongoCollection<Document> collection = database.getCollection("cars"); 
	      System.out.println("Collection sampleCollection selected successfully");
	      Document document = new Document("carid", carid) 
	      .append("brand", name)
	      .append("Vehiclenumber", vn) 
	      .append("seatingcapacity", seat)
	      .append("description", desc) 
	      .append("rentperday", rpd);
	      collection.insertOne(document); 
		//inserting document int he collection with information retrieved
	      System.out.println("Document inserted successfully");  
	      response.sendRedirect("addcarsuccess.html");
	        
	       
	        
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
