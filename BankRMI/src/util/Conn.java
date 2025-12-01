package util;
import java.sql.*;
public class Conn {


	  private static final String URL = "jdbc:mysql://localhost:3306/banque";
	  private static final String username = "root";
	  private static final String password = "MASTERIISE@";
	  
	  public static Connection getConnection () {	
			try
			{

				return DriverManager.getConnection(URL, username, password);
			}
			catch(Exception e)
			{
	            e.printStackTrace();
	            return null;

			}
		}	
}
