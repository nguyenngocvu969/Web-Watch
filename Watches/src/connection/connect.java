package connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

 
public class connect {
 
    // Kết nối vào SQL Server.
    // (Sử dụng thư viện SQLJDBC)
    public static Connection getSQLServerConnection_SQLJDBC() //
            throws ClassNotFoundException, SQLException {
 
        // Chú ý: Thay đổi các thông số kết nối cho phù hợp.
        String hostName = "localhost";
        String sqlInstanceName = "SQLEXPRESS";
        String database = "shopwatch";
        String userName = "sa";
        String password = "123";
 
        return getSQLServerConnection_SQLJDBC(hostName, sqlInstanceName, database, userName, password);
    }
 
    // Kết nối tới SQLServer, sử dụng thư viện SQLJDBC.
    private static Connection getSQLServerConnection_SQLJDBC(String hostName, //
            String sqlInstanceName, String database, String userName, String password)//
            throws ClassNotFoundException, SQLException {
 
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
 
        // Cấu trúc URL Connection dành cho SQLServer
        // Ví dụ:
        // jdbc:sqlserver://ServerIp:1433/SQLEXPRESS;databaseName=simplehr
        String connectionURL = "jdbc:sqlserver://" + hostName + ":1433" //
                + ";instance=" + sqlInstanceName + ";databaseName=" + database;
 
        Connection conn = DriverManager.getConnection(connectionURL, userName, password);
        return conn;
    }
    public static void main(String[] args) throws ClassNotFoundException, SQLException {
    	System.out.println("thanh cong");
		System.out.println(getSQLServerConnection_SQLJDBC());
	}

	public static Connection getConnection() {
		
		return null;
	}
}