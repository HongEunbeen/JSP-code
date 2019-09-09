package jsp.util;
 
import java.sql.*;
import java.sql.SQLException;

public class DBConnection 
{
	  public static Connection getConnection () {
	        String user = "project3617";
	        String pw = "1234";
	        String url = "jdbc:oracle:thin:@10.96.124.213:1521:xe";
	        Connection conn = null;
	        
	        try {
	            Class.forName("oracle.jdbc.driver.OracleDriver");
	        } catch (ClassNotFoundException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }
	        try {
	            conn = DriverManager.getConnection(url, user, pw);
	            System.out.println("연결");
	        } catch (SQLException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        } 
	        return conn;
	    }
}