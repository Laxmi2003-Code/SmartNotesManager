package util;
import java.sql.Connection;
import java.sql.DriverManager;
public class DBConnection {

	static Connection con;
	public static Connection getConnection() {
		try {
	     Class.forName("com.mysql.cj.jdbc.Driver");
	     con = DriverManager.getConnection("jdbc:mysql://localhost:3306/notes_manager","root","Lakshmi@1234");
	     System.out.println("Database Connected");
		}catch(Exception e) {
		  e.printStackTrace();	
		}
		return con;
	}
	    		  
}
