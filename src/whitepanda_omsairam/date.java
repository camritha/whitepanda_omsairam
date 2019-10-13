package whitepanda_omsairam;

import java.text.DateFormat;

import java.text.SimpleDateFormat;  
import java.util.Date;

import com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException;  
public class date {  
public static void main(String[] args)throws Exception {  
	String start_dt = "2011-01-01";
	 SimpleDateFormat curFormater = new SimpleDateFormat("yyyy-mm-dd"); 

	    Date dateObj = null;
		try {
	        dateObj = curFormater.parse(start_dt);
	    } catch (ParseException e) {
	        // TODO Auto-generated catch block
	        e.printStackTrace();
	    } 
	    SimpleDateFormat postFormater = new SimpleDateFormat("yyyy-mm-dd"); 

	    String newDateStr = postFormater.format(dateObj); 
	    System.out.print(newDateStr);
}  
}  