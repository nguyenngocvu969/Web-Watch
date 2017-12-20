package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connection.connect;
import model.Category;

public class CategoryDAO {
	public static ArrayList<Category> getAllCategory() throws ClassNotFoundException, SQLException{
		Connection conn = connect.getSQLServerConnection_SQLJDBC();
		PreparedStatement ps = conn.prepareStatement("select * from category");
		ResultSet rs = ps.executeQuery();
		ArrayList<Category> list = new ArrayList<Category>();
		while (rs.next()) {
			Category c = new Category();
			c.setId(rs.getInt("id"));
			c.setName(rs.getString("name"));
			list.add(c);
		}
		return list;
	}
	
	public static Category getCategoryById(int id) throws ClassNotFoundException, SQLException {
		Connection conn = connect.getSQLServerConnection_SQLJDBC();
		PreparedStatement ps = conn.prepareStatement("select * from category where id="+id);
		ResultSet rs = ps.executeQuery();
		Category c = new Category();
		while (rs.next()) {
			c.setId(rs.getInt("id"));
			c.setName(rs.getString("name"));
		}
		return c;
	}
	
	public static boolean insert(String name) throws SQLException {
	    try {
	         Connection connection = connect.getSQLServerConnection_SQLJDBC();
	         String sql = "INSERT INTO category(name) VALUEs(?)";
	         PreparedStatement ps = connection.prepareCall(sql);
	         ps.setString(1, name);
	         int temp = ps.executeUpdate();
	         return temp == 1;
	    } catch (Exception e) {
	         return false;
	    }
	}
	public static boolean update(Category c) throws SQLException {
	    try {
	         Connection connection = connect.getSQLServerConnection_SQLJDBC();
	         String sql = "update category set name='"+c.getName()+"' where id = "+c.getId();
	         PreparedStatement ps = connection.prepareCall(sql);
	         int temp = ps.executeUpdate();
	         return temp == 1;
	    } catch (Exception e) {
	         return false;
	    }
	}
	public static boolean delete(int id) throws SQLException {
	    try {
	         Connection connection = connect.getSQLServerConnection_SQLJDBC();
	         String sql = "DELETE FROM category WHERE id = "+id;
	         PreparedStatement ps = connection.prepareCall(sql);
	         int temp = ps.executeUpdate();
	         return temp == 1;
	    } catch (Exception e) {
	         return false;
	    }
	}
	
	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		System.out.println(update(new Category(12,"Omega 1")));
	}
}
