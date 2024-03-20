package DB;
import java.sql.*;
public class DBConnection {

	public static Connection CreateConnection() {
		Connection conn = null;
		String url = "jdbc:mysql://127.0.0.1:3306/cnpm?useUnicode=true&characterEncoding=utf8";
		String username = "root";
		String password = "huythang02";
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			// create connection
			conn = DriverManager.getConnection(url, username, password);
//			conn.close();
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return conn;
	}
	
}
