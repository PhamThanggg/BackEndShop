package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import DB.DBConnection;

public class OrderDao {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	// add order
	public int addOrder(int id_user, String delivery) {
		String sql = "insert into `order` (`order_date`, `status`, `delivery`, `user_id`)\r\n"
				+ "values (?, '0' , ?, ?)";
		
 		try{
 			conn = new DBConnection().CreateConnection();
			ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			LocalDateTime currentTime = LocalDateTime.now();
		    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("YYYY-MM-dd HH:mm:ss");
		    String formattedDateTime = currentTime.format(formatter);
		    
			ps.setString(1, formattedDateTime);
			ps.setString(2, delivery);
			ps.setInt(3, id_user);
			ps.executeUpdate();
			
			rs = ps.getGeneratedKeys();
			while(rs.next()) {
				return rs.getInt(1);
			}
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	
	// add order deteil;
	public void addOrderDetail(String data) {
		String sql = "insert into order_detail (`product_id`, `product_name`, `price`, `quantity`, `image`, `size`, `order_id`)\r\n"
				+ "values "+data;
		
		try {
			conn = new DBConnection().CreateConnection();
			ps = conn.prepareStatement(sql);
			//ps.setString(1, data);
			ps.executeUpdate();

			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	// add dia chi thong tin giao hang cua order
	public void infoOrder(String fullname, String phone, String address, String city, int order_id) {
		String sql = "insert into information_delivery (`fullname`, `phone`, `address`, `city`, `order_id`)\r\n"
				+ "values (?, ?, ?, ?, ?)";
		
		try {
			conn = new DBConnection().CreateConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, fullname);
			ps.setString(2, phone);
			ps.setString(3, address);
			ps.setString(4, city);
			ps.setInt(5, order_id);
			ps.executeUpdate();

			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	
}
