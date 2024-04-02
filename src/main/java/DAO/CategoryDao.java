package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import DB.DBConnection;
import Model.Cart;
import Model.Category;

public class CategoryDao {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public List<Category> getCategory() {
		String query = "select * from category";
		List<Category> list = new ArrayList<Category>();
		try {
			conn = new DBConnection().CreateConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				Category c = new Category(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4), null);
				list.add(c);
			}
			ps.close();
		} catch (Exception e) {
			// TODO: handle exception
		}

		return list;
	}
	
	public static void main(String[] args) {
		CategoryDao dao = new CategoryDao();
		List<Category> list = dao.getCategory();
		for (Category category : list) {
			System.out.println(category.toString());
		}
		
	}
}
