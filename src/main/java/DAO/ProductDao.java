package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import Model.Product;
import DB.DBConnection;

public class ProductDao {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	// them sp
	public void addProduct(String name, String price, String quantity, String des, String image, String size, String color, String cateId, int user_id) {
		String sql = "insert into `products` (`name`, `status`, `price`, `quantity`, `description`, `imagel`, `size`, `color`, `sell_count`, `cate_id`, `user_id`, `create_date`)\r\n"
				+ "values (?, '1', ?, ?, ?, ?, ?, ?, 0, ?, ?, ?)";
		
 		try{
 			conn = new DBConnection().CreateConnection();
			ps = conn.prepareStatement(sql);
			String timeNow = Time.timeNow();
		    
			ps.setString(1, name);
			ps.setString(2, price);
			ps.setString(3, quantity);
			ps.setString(4, des);
			ps.setString(5, image);
			ps.setString(6, size);
			ps.setString(7, color);
			ps.setString(8, cateId);
			ps.setInt(9, user_id);
			ps.setString(10, timeNow);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	// them sp
		public void updateProduct(String name, String status, String price, String quantity, String des, String image, String size, String color, String cateId, String id) {
			String sql = "UPDATE products\r\n"
					+ "SET  `name` = ?, `status` = ?, `price` = ?, `quantity` = ?,\r\n"
					+ "    `description` = ?, `imagel` = ?, `size` = ?, `color` = ?, `cate_id` = ?\r\n"
					+ "WHERE product_id = ?";
			
	 		try{
	 			conn = new DBConnection().CreateConnection();
				ps = conn.prepareStatement(sql);
			    
				ps.setString(1, name);
				ps.setString(2, status);
				ps.setString(3, price);
				ps.setString(4, quantity);
				ps.setString(5, des);
				ps.setString(6, image);
				ps.setString(7, size);
				ps.setString(8, color);
				ps.setString(9, cateId);
				ps.setString(10, id);
				
				ps.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	
	// phaan trang sp
	public List<Product> getAllProduct(int index, int soluong) {
		List<Product> list = new ArrayList<Product>();
		String query = "select * from products\r\n" + "order by product_id \r\n" + "LIMIT ? OFFSET ?";

		try {
			conn = new DBConnection().CreateConnection();
			ps = conn.prepareStatement(query);
			if (index == 1) {
				ps.setInt(1, soluong);
				ps.setInt(2, (index - 1) * soluong);
			} else {
				ps.setInt(1, soluong);
				ps.setInt(2, (index - 1) * (soluong));
			}

			rs = ps.executeQuery();

			while (rs.next()) {
				Product pro = new Product();
				pro.setId(rs.getInt("product_id"));
				pro.setName(rs.getString("name"));
				pro.setStatus(rs.getInt("status"));
				pro.setPrice(rs.getFloat("price"));
				pro.setQuantity(rs.getInt("quantity"));
				pro.setDes(rs.getString("description"));
				pro.setImg(rs.getString("imagel"));
				pro.setColor(rs.getString("color"));
				pro.setSell(rs.getInt("sell_count"));
				pro.setCateId(rs.getInt("cate_id"));
				pro.setUserId(rs.getInt("user_id"));
				pro.setCreateDate(rs.getDate("create_date"));
				pro.setSize(rs.getString("size"));
				list.add(pro);

			}

		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}

	// dem so sp trong data
	public int countP() {
		String query = "select count(*) from products";

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

	// lay san pham theo gia
	public List<Product> getProductPrice(int index, int soluong, String priceBegin, String priceEnd) {
		List<Product> list = new ArrayList<Product>();
		String query = "select * from products\r\n" + "where price>? AND price <= ? \r\n" + "order by product_id \r\n"
				+ "LIMIT ? OFFSET ?";

		try {
			conn = new DBConnection().CreateConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, priceBegin);
			ps.setString(2, priceEnd);
			if (index == 1) {
				ps.setInt(3, soluong);
				ps.setInt(4, (index - 1) * soluong);
			} else {
				ps.setInt(3, soluong);
				ps.setInt(4, (index - 1) * (soluong));
			}

			rs = ps.executeQuery();

			while (rs.next()) {
				Product pro = new Product();
				pro.setId(rs.getInt("product_id"));
				pro.setName(rs.getString("name"));
				pro.setStatus(rs.getInt("status"));
				pro.setPrice(rs.getFloat("price"));
				pro.setQuantity(rs.getInt("quantity"));
				pro.setDes(rs.getString("description"));
				pro.setImg(rs.getString("imagel"));
				pro.setColor(rs.getString("color"));
				pro.setSell(rs.getInt("sell_count"));
				pro.setCateId(rs.getInt("cate_id"));
				pro.setUserId(rs.getInt("user_id"));
				pro.setCreateDate(rs.getDate("create_date"));
				pro.setSize(rs.getString("size"));
				list.add(pro);

			}

		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}

	// dem so sp trong data
	public int countP(String priceBegin, String priceEnd) {
		String query = "select count(*) from products where price>? AND price <= ?";

		try {
			conn = new DBConnection().CreateConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, priceBegin);
			ps.setString(2, priceEnd);
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

	// search
	public List<Product> getProductSearch(int index, int soluong, String name) {
		List<Product> list = new ArrayList<Product>();
		String query = "select * from products\r\n" + "where name like ? \r\n" + "order by product_id \r\n"
				+ "LIMIT ? OFFSET ?";

		try {
			conn = new DBConnection().CreateConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, "%" + name + "%");
			if (index == 1) {
				ps.setInt(2, soluong);
				ps.setInt(3, (index - 1) * soluong);
			} else {
				ps.setInt(2, soluong);
				ps.setInt(3, (index - 1) * (soluong));
			}

			rs = ps.executeQuery();

			while (rs.next()) {
				Product pro = new Product();
				pro.setId(rs.getInt("product_id"));
				pro.setName(rs.getString("name"));
				pro.setStatus(rs.getInt("status"));
				pro.setPrice(rs.getFloat("price"));
				pro.setQuantity(rs.getInt("quantity"));
				pro.setDes(rs.getString("description"));
				pro.setImg(rs.getString("imagel"));
				pro.setColor(rs.getString("color"));
				pro.setSell(rs.getInt("sell_count"));
				pro.setCateId(rs.getInt("cate_id"));
				pro.setUserId(rs.getInt("user_id"));
				pro.setCreateDate(rs.getDate("create_date"));
				pro.setSize(rs.getString("size"));
				list.add(pro);

			}

		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}

	// dem so sp search đc
	public int countP(String name) {
		String query = "select count(*) from products where name like '%?%' ";

		try {
			conn = new DBConnection().CreateConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, name);
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

	// Lấy ra sp mới nhất
	public List<Product> getNewProduct(int count) {
		List<Product> list = new ArrayList<Product>();
		String query = "SELECT * FROM products \r\n"
				+ "join users on products.user_id = users.user_id\r\n"
				+ "ORDER BY product_id DESC LIMIT ? OFFSET 0;";
		try {
			conn = new DBConnection().CreateConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, count);
			rs = ps.executeQuery();

			while (rs.next()) {
				Product pro = new Product();
				pro.setId(rs.getInt("product_id"));
				pro.setName(rs.getString("name"));
				pro.setStatus(rs.getInt("status"));
				pro.setPrice(rs.getFloat("price"));
				pro.setQuantity(rs.getInt("quantity"));
				pro.setDes(rs.getString("description"));
				pro.setImg(rs.getString("imagel"));
				pro.setColor(rs.getString("color"));
				pro.setSell(rs.getInt("sell_count"));
				pro.setCateId(rs.getInt("cate_id"));
				pro.setUserId(rs.getInt("user_id"));
				pro.setCreateDate(rs.getDate("create_date"));
				pro.setSize(rs.getString("size"));
				pro.setNameUser(rs.getString("user_name"));
				list.add(pro);
			}
			ps.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}

	// Lấy ra sp bán nhiều nhất
		public List<Product> getSellMax(int count) {
			List<Product> list = new ArrayList<Product>();
			String query = "SELECT * \r\n" + "FROM products\r\n" + "ORDER BY sell_count DESC\r\n" + "LIMIT ? OFFSET 0;";
			try {
				conn = new DBConnection().CreateConnection();
				ps = conn.prepareStatement(query);
				ps.setInt(1, count);
				rs = ps.executeQuery();

				while (rs.next()) {
					Product pro = new Product();
					pro.setId(rs.getInt("product_id"));
					pro.setName(rs.getString("name"));
					pro.setStatus(rs.getInt("status"));
					pro.setPrice(rs.getFloat("price"));
					pro.setQuantity(rs.getInt("quantity"));
					pro.setDes(rs.getString("description"));
					pro.setImg(rs.getString("imagel"));
					pro.setColor(rs.getString("color"));
					pro.setSell(rs.getInt("sell_count"));
					pro.setCateId(rs.getInt("cate_id"));
					pro.setUserId(rs.getInt("user_id"));
					pro.setCreateDate(rs.getDate("create_date"));
					pro.setSize(rs.getString("size"));
					list.add(pro);
				}
				ps.close();
			} catch (Exception e) {
				// TODO: handle exception
			}
			return list;
		}
		
		// Lấy ra sp bán nhiều nhất
				public List<Product> getAllProduct(int count) {
					List<Product> list = new ArrayList<Product>();
					String query = "SELECT * FROM products \r\n"
							+ "join category on products.cate_id = category.cate_id\r\n"
							+ "join users on products.user_id = users.user_id\r\n"
							+ "ORDER BY product_id DESC LIMIT ? OFFSET 0;";
					try {
						conn = new DBConnection().CreateConnection();
						ps = conn.prepareStatement(query);
						ps.setInt(1, count);
						rs = ps.executeQuery();

						while (rs.next()) {
							Product pro = new Product();
							pro.setId(rs.getInt("product_id"));
							pro.setName(rs.getString("name"));
							pro.setStatus(rs.getInt("status"));
							pro.setPrice(rs.getFloat("price"));
							pro.setQuantity(rs.getInt("quantity"));
							pro.setDes(rs.getString("description"));
							pro.setImg(rs.getString("imagel"));
							pro.setColor(rs.getString("color"));
							pro.setSell(rs.getInt("sell_count"));
							pro.setCateId(rs.getInt("cate_id"));
							pro.setUserId(rs.getInt("user_id"));
							pro.setCreateDate(rs.getDate("create_date"));
							pro.setSize(rs.getString("size"));
							pro.setNameUser(rs.getString("user_name"));
							pro.setNameCate(rs.getString("category.name"));
							list.add(pro);
						}
						ps.close();
					} catch (Exception e) {
						// TODO: handle exception
					}
					return list;
				}
	
	public void deleteProduct(String pid) {
		String sql = "delete from products where product_id = ?";
		
 		try{
 			conn = new DBConnection().CreateConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, pid);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
				
	public static void main(String[] args) {
		ProductDao dao = new ProductDao();

		
		//dao.addProduct("1", "1", "1", "1", "1", "1", "1", "1", 1);

	
	}
}
