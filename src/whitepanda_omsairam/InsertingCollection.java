package whitepanda_omsairam;

import com.mongodb.client.MongoCollection; 
import com.mongodb.client.MongoDatabase; 

import org.bson.Document;  
import com.mongodb.MongoClient; 
import com.mongodb.MongoCredential;  

public class InsertingCollection { 
   
   public static void main( String args[] ) {  
      
      // Creating a Mongo client 
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
      int carid=1;
      Document document = new Document("carbrand", "Maruti") 
      .append("id", carid)
      .append("description", "Maruti suzuki swift dezire") 
      .append("seatingcapacity", 5);
      collection.insertOne(document); //inserting the user entered information about car as a dcument in collection
      System.out.println("Document inserted successfully");     
   } 
}
