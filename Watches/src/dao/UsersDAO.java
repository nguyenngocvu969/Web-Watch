package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import connection.connect;

public class UsersDAO {
		public static boolean checkEmail(String email) throws SQLException, ClassNotFoundException {
		Connection connection = connect.getSQLServerConnection_SQLJDBC();
		String sql= " SELECT * FROM Users WHERE user_email = '"+email+"'";
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()){
				connection.close();
				return true;
				
			}
		} catch (SQLException ex) {
			Logger.getLogger(UsersDAO.class.getName()).log(Level. SEVERE, null, ex);
		}
		
		return false;
		
		}
		public static void main(String[] args) throws SQLException, ClassNotFoundException {
			System.out.println(checkEmail("nguyenngocvu969@gmail.com"));
		}
}
