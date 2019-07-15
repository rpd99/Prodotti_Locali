package ecommerce.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class UtenteDAO {

	public List<Utente> doRetrieveAll() {
		try (Connection con = DBConnectionPool.getConnection()) {
			PreparedStatement ps = con.prepareStatement("SELECT * FROM utente");
			ArrayList<Utente> utenti = new ArrayList<>();
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Utente c = new Utente();
				c.setEmail(rs.getString(1));
				c.setNome(rs.getString(2));
				c.setCognome(rs.getString(3));
				c.setPassword_utente(rs.getString(4));
				c.setIs_Admin(rs.getInt(5));
				
				utenti.add(c);
			}
			DBConnectionPool.releaseConnection(con);
			return utenti;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public Utente doRetrieveByID(String email) {
		try (Connection con = DBConnectionPool.getConnection()) {
			PreparedStatement ps = con.prepareStatement("SELECT * FROM utente WHERE email=?");
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			Utente c = null;
			while (rs.next()) {
				c = new Utente();
				c.setEmail(rs.getString(1));
				c.setNome(rs.getString(2));
				c.setCognome(rs.getString(3));
				c.setPassword_utente(rs.getString(4));
				c.setIs_Admin(rs.getInt(5));
			}
			DBConnectionPool.releaseConnection(con);
			return c;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public Utente doRetrieveByEmailPassword(String email, String password) {
		try (Connection con = DBConnectionPool.getConnection()) {
			PreparedStatement ps = con.prepareStatement("SELECT * FROM utente WHERE email=? && password_utente=?");
			ps.setString(1, email);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			Utente c = null;
			while (rs.next()) {
				c = new Utente();
				c.setEmail(rs.getString(1));
				c.setNome(rs.getString(2));
				c.setCognome(rs.getString(3));
				c.setPassword_utente(rs.getString(4));
				c.setIs_Admin(rs.getInt(5));
			}
			DBConnectionPool.releaseConnection(con);
			return c;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void doSave(Utente utente) {
		try (Connection con = DBConnectionPool.getConnection()) {
			PreparedStatement ps = con.prepareStatement("INSERT INTO utente (email, nome, cognome, password_utente, isAdmin) VALUES(?,?,?,?,?)",
					Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, utente.getEmail());
			ps.setString(2, utente.getNome());
			ps.setString(3, utente.getCognome());
			ps.setString(4, utente.getPassword_utente());
			ps.setInt(5, utente.getIs_Admin());
			if (ps.executeUpdate() != 1) {
				throw new RuntimeException("INSERT error.");
			}

			con.commit();
			DBConnectionPool.releaseConnection(con);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void doUpdate(Utente utente) {
		try (Connection con = DBConnectionPool.getConnection()) {
			PreparedStatement ps = con.prepareStatement("UPDATE utente SET email=?, nome=?, cognome=?, password_utente=?, isAdmin=? WHERE email=?");
			ps.setString(1, utente.getEmail());
			ps.setString(2, utente.getNome());
			ps.setString(3, utente.getCognome());
			ps.setString(4, utente.getPassword_utente());
			ps.setInt(5, utente.getIs_Admin());
			ps.setString(6, utente.getEmail());
			if (ps.executeUpdate() != 1) {
				throw new RuntimeException("UPDATE error.");
			}
			
			con.commit();
			DBConnectionPool.releaseConnection(con);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void doDelete(String email) {
		try (Connection con = DBConnectionPool.getConnection()) {
			PreparedStatement ps = con.prepareStatement("DELETE FROM utente WHERE email=?");
			ps.setString(1, email);
			if (ps.executeUpdate() != 1) {
				throw new RuntimeException("DELETE error.");
			}
			con.commit();
			DBConnectionPool.releaseConnection(con);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
