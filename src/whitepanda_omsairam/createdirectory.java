//used to create collection not used in web service

package whitepanda_omsairam;

import com.mongodb.client.MongoDatabase; 
import com.mongodb.MongoClient; 
import com.mongodb.MongoCredential;

public class createdirectory {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		 MongoClient mongo = new MongoClient( "localhost" , 27017 ); 
	     
	      // Creating Credentials 
	      MongoCredential credential; 
	      credential = MongoCredential.createCredential("sampleUser", "whitepanda","password".toCharArray()); 
	      System.out.println("Connected to the database successfully");  
	      
	      //Accessing the database 
	      MongoDatabase database = mongo.getDatabase("whitepanda");  
	      
	      //Creating a collection 
	      database.createCollection("booking"); 
	      System.out.println("Collection created successfully"); 
	}

}
