package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import DB.DBConnection;
import Model.Account;
import Model.Cart;
import Model.Product;

public class CartDao {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	// get Cart
		public List<Cart> getCartItem(int id_User) {
			String query = "select * from carts \r\n"
					+ "join products on carts.id_product = products.product_id\r\n"
					+ "where id_user = ? ORDER BY time DESC";
			List<Cart> list = new ArrayList<Cart>();
			try {
				conn = new DBConnection().CreateConnection();
				ps = conn.prepareStatement(query);
				ps.setInt(1, id_User);
				rs = ps.executeQuery();
				while (rs.next()) {
					Cart c = new Cart();
					c.setCartId(rs.getInt("cart_id"));
					c.setId_user(rs.getInt("id_user"));
					c.setId_product(rs.getInt("id_product"));
					c.setQuantity(rs.getInt("quantity"));
					c.setPrice(rs.getDouble("priceCount"));
					c.setSize(rs.getString("size"));
					c.setImg(rs.getString("imagel"));
					c.setDes(rs.getString("description"));
					c.setPrice_one(rs.getDouble("price"));
					c.setName(rs.getString("name"));
					list.add(c);
				}
				ps.close();
			} catch (Exception e) {
				// TODO: handle exception
			}

			return list;
		}
		
		// add product into cart
		public void addCartItem(int id_user, String id_product, String quantity, double price, String size) {
			String query = "INSERT INTO carts (id_user, id_product, quantity, priceCount, size, time)\r\n"
					+ "VALUES (?, ?, ?, ?, ?, ?)";
			
			try {
				LocalDateTime currentTime = LocalDateTime.now();
			    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("YYYY/MM/dd HH:mm:ss");
			    String formattedDateTime = currentTime.format(formatter);
				conn = new DBConnection().CreateConnection();
				ps = conn.prepareStatement(query);
				ps.setInt(1, id_user);
				ps.setString(2, id_product);
				ps.setString(3, quantity);
				ps.setDouble(4, price);
				ps.setString(5, size);
				ps.setString(6, formattedDateTime);	
				ps.executeUpdate();

			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		
		// cap nhat item trong cart
		public void updateCartItem(int id_user, String id_product, double quantity, double price) {
			String query = "UPDATE carts SET quantity = ?, priceCount = ?, `time` = ?\r\n"
					+ "where (`id_user` = ? AND `id_product` = ?);";
			
			try {
				LocalDateTime currentTime = LocalDateTime.now();
			    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("YYYY/MM/dd HH:mm:ss");
			    String formattedDateTime = currentTime.format(formatter);
				conn = new DBConnection().CreateConnection();
				ps = conn.prepareStatement(query);
				ps.setDouble(1, quantity);
				ps.setDouble(2, price);
				ps.setString(3, formattedDateTime);
				ps.setInt(4, id_user);
				ps.setString(5, id_product);	
				ps.executeUpdate();

			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		
		// xoa 1 sp trong gio hang
		public void deleteCartItem(String id) {
			String query = "delete from carts where cart_id = ?";

			try {
				conn = new DBConnection().CreateConnection();
				ps = conn.prepareStatement(query);
				ps.setString(1, id);
				ps.executeUpdate();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		// dem so sp trong gio hang
		public int countCartItem() {
			String query = "select count(*) from carts";
			try {
				conn = new DBConnection().CreateConnection();
				ps = conn.prepareStatement(query);
				rs = ps.executeQuery();
				while (rs.next()) {
					return rs.getInt(1);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			return 0;
		}
		
		// check sp ton tai chua
		public Cart checkExistsP(String id_product) {
			String query = "select * from carts join products on carts.id_product = products.product_id where id_product = ?";
			Cart c = new Cart();

			try {
				conn = new DBConnection().CreateConnection();
				ps = conn.prepareStatement(query);
				ps.setString(1, id_product);
				rs = ps.executeQuery();
				while (rs.next()) {
					c.setCartId(rs.getInt("cart_id"));
					c.setId_user(rs.getInt("id_user"));
					c.setId_product(rs.getInt("id_product"));
					c.setQuantity(rs.getInt("quantity"));
					c.setPrice(rs.getDouble("priceCount"));
					c.setSize(rs.getString("size"));
					c.setImg(rs.getString("imagel"));
					c.setDes(rs.getString("description"));
					c.setPrice_one(rs.getDouble("price"));
					c.setName(rs.getString("name"));
					return c;
				}
				ps.close();

			} catch (Exception e) {
				// TODO: handle exception
			}
			return null;
		}
		
		// lấy ra ds checkout
		public List<Cart> getCartItemCo(String queryy) {
				String query = "select * from carts join products on carts.id_product = products.product_id \r\n"
						+ "where "+ queryy + " ORDER BY time DESC";
			List<Cart> list = new ArrayList<Cart>();
			try {
				conn = new DBConnection().CreateConnection();
				ps = conn.prepareStatement(query);
//				ps.setString(1, queryy);
				rs = ps.executeQuery();
				while (rs.next()) {
					Cart c = new Cart();
					c.setCartId(rs.getInt("cart_id"));
					c.setId_user(rs.getInt("id_user"));
					c.setId_product(rs.getInt("id_product"));
					c.setQuantity(rs.getInt("quantity"));
					c.setPrice(rs.getDouble("priceCount"));
					c.setSize(rs.getString("size"));
					c.setImg(rs.getString("imagel"));
					c.setDes(rs.getString("description"));
					c.setPrice_one(rs.getDouble("price"));
					c.setName(rs.getString("name"));
					list.add(c);
				}
				ps.close();
			} catch (Exception e) {
				// TODO: handle exception
			}

			return list;
		}
		
		// delete item da dat hang
		public void deleteItemOrder(String id) {
			String query = "delete from carts where cart_id IN ("+ id +") ";

			try {
				conn = new DBConnection().CreateConnection();
				ps = conn.prepareStatement(query);
				ps.executeUpdate();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		public static void main(String[] args) {
			CartDao dao = new CartDao();
//			List<Cart> listC = dao.getCartItemCo("cart_id = 22 or cart_id = 19 or cart_id = 15 or cart_id = 21 or cart_id = 20");
//			for (Cart item : listC) {
//				System.out.println(item.toString());
//			}
			
//			String query = "";
//	    	 for (int i = 0;i < listC.size(); i++) {
//	    		query += " (" + listC.get(i).getId_product() + ", '" + listC.get(i).getName() +
//	    				"', " + listC.get(i).getPrice() + ", " + listC.get(i).getQuantity() +
//	    				", '" + listC.get(i).getImg() + "', '" + listC.get(i).getSize() +
//	    				"', " + 1 + "), \n";
//			}
//	    	 
//	    	 System.out.println(query);
//			OrderDao oDao = new OrderDao();
//			String url = "22-19-15-21-20";
//			String []product = url.split("-");
//	    	 String data = "";
//	    	 int dem = 0;
//	    	 for (String item : product) {
//	    		 dem++;
//				data += "cart_id = " + item;
//				if(product.length > dem) {
//					data += " or ";
//				}
//			}
//	    	 int id_order = 5;
//	    	 
//	    	 // (`product_id`, `product_name`, `price`, `quantity`, `image`, `size`, `order_id`)
//	    	 List<Cart> listC = dao.getCartItemCo(data);
//	    	 String query = "";
//	    	 for (int i = 0;i < listC.size(); i++) {
//	    		query += " (" + listC.get(i).getId_product() + ", '" + listC.get(i).getName() +
//	    				"', " + listC.get(i).getPrice() + ", " + listC.get(i).getQuantity() +
//	    				", '" + listC.get(i).getImg() + "', '" + listC.get(i).getSize() +
//	    				"', " + id_order + ")";
//	    		if(listC.size()-1 > i) {
//	    			query += ", \n";
//	    		}
//			}
//	    	 System.out.println(query);
	    	 
	    	 //oDao.infoOrder(fullname, phone, adrress, city, id_order);
				

		}
}
