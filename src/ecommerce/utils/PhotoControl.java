package ecommerce.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.*;
import ecommerce.model.DBConnectionPool;

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
					try {
						DBConnectionPool.releaseConnection(connection);
					} catch (SQLException e) {
						e.printStackTrace();
					}
			}
		}
		return bt;
	}
	
public synchronized static void upload(String id, String urlPhoto, String table) throws SQLException {
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
			} catch (IOException | SQLException e ) {
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
					try {
						DBConnectionPool.releaseConnection(connection);
					} catch (SQLException e) {
						e.printStackTrace();
					}
			}
		}
	}
}
