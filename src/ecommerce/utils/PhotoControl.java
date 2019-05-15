package ecommerce.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.*;

public class PhotoControl {
	public synchronized static byte[] load(String id, String table) {
		
		Connection connection = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		byte[] bt = null;
		
		try {
			connection = DBConnectionPool.getConnection();
			String sql = "SELECT img FROM " + table + " WHERE id = " + id;
			stmt = connection.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			if (rs.next()) {
				bt = rs.getBytes("img");
			}
		} catch (SQLException sqlException) {
			
		} finally {
			try {
				if (stmt != null)
					stmt.close();
			} catch (SQLException sqlException) {
				
			} finally {
				if (connection != null)
					DBConnectionPool.releaseConnection(connection);
			}
		}
		return bt;
	}
	
public synchronized static byte[] upload(String id, String urlPhoto, String table) {
		Connection connection = null;
		PreparedStatement stmt = null;
		
		try {
			connection = DBConnectionPool.getConnection();
			stmt = connection.prepareStatement("UPDATE " + table + " SET img = ? WHERE id = ?");
			
			File file = new File(urlPhoto);
			try {
				FileInputStream fis = new FileInputStream(file);
				stmt.setBinaryStream(1, fis, fis.available());
				stmt.setString(2, id);
				
				stmt.executeUpdate();
				connection.commit();
			} catch (IOException e) {
				/* ... */
			}
		} finally {
			try {
				if (stmt != null)
					stmt.close();
			} catch (SQLException sqlException) {
				/* ... */
			} finally {
				if (connection != null)
					DBConnectionPool.releaseConnection(connection);
			}
		}
	}
}
