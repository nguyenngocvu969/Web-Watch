package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connection.connect;
import model.Category;
import model.Product;

public class ProductDAO {
	public static ArrayList<Product> getAllProduct() throws ClassNotFoundException, SQLException{
		Connection conn = connect.getSQLServerConnection_SQLJDBC();
		PreparedStatement ps = conn.prepareStatement("select a.*,b.name as name_cat from product a inner join category b on a.id_cat = b.id");
		ResultSet rs = ps.executeQuery();
		ArrayList<Product> list = new ArrayList<Product>();
		while (rs.next()) {
			Product p = new Product();
			p.setDesctiption(rs.getString("description"));
			p.setId(rs.getInt("id"));
			p.setId_cat(rs.getInt("id_cat"));
			p.setName(rs.getString("name"));
			p.setPrice(rs.getDouble("price"));
			p.setName_cat(rs.getString("name_cat"));
			list.add(p);
		}
		return list;
	}
	public static Product getProductByid(int id) throws ClassNotFoundException, SQLException{
		Connection conn = connect.getSQLServerConnection_SQLJDBC();
		PreparedStatement ps = conn.prepareStatement("select a.*,b.name as name_cat from product a inner join category b on a.id_cat = b.id where a.id="+id);
		ResultSet rs = ps.executeQuery();
		Product p = new Product();
		while (rs.next()) {
			p.setDesctiption(rs.getString("description"));
			p.setId(rs.getInt("id"));
			p.setId_cat(rs.getInt("id_cat"));
			p.setName(rs.getString("name"));
			p.setPrice(rs.getDouble("price"));
			p.setName_cat(rs.getString("name_cat"));
		}
		return p;
	}
	public static boolean insert(Product p) throws SQLException {
	    try {
	         Connection connection = connect.getSQLServerConnection_SQLJDBC();
	         String sql = "INSERT INTO product(name,id_cat,description,price) VALUEs(?,?,?,?)";
	         PreparedStatement ps = connection.prepareCall(sql);
	         ps.setString(1, p.getName());
	         ps.setInt(2, p.getId_cat());
	         ps.setString(3, p.getDesctiption());
	         ps.setDouble(4, p.getPrice());
	         int temp = ps.executeUpdate();
	         return temp == 1;
	    } catch (Exception e) {
	         return false;
	    }
	}
	public static boolean update(Product p) throws SQLException {
	    try {
	         Connection connection = connect.getSQLServerConnection_SQLJDBC();
	         String sql = "update product set name = ?,id_cat=?,description=?,price=? where id = ?";
	         PreparedStatement ps = connection.prepareCall(sql);
	         ps.setString(1, p.getName());
	         ps.setInt(2, p.getId_cat());
	         ps.setString(3, p.getDesctiption());
	         ps.setDouble(4, p.getPrice());
	         ps.setInt(5, p.getId());
	         int temp = ps.executeUpdate();
	         return temp == 1;
	    } catch (Exception e) {
	         return false;
	    }
	}
	public static boolean delete(int id) throws SQLException {
	    try {
	         Connection connection = connect.getSQLServerConnection_SQLJDBC();
	         String sql = "delete from product where id = "+id;
	         PreparedStatement ps = connection.prepareCall(sql);
	         int temp = ps.executeUpdate();
	         return temp == 1;
	    } catch (Exception e) {
	         return false;
	    }
	}
	public static void main(String[] args) throws SQLException {
//		Product p = new Product();
//		p.setDesctiption("abc");
//		p.setId_cat(1);
//		p.setName("Rolex 2");
//		p.setPrice(Double.parseDouble("2000"));
//		System.out.println(insert(p));
		try {
			System.out.println(getProductByid(3));
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
