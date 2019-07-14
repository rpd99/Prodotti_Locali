package ecommerce.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;import java.sql.SQLIntegrityConstraintViolationException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ProdottoDAO {

	public List<Prodotto> doRetrieveAll() {
		try (Connection con = DBConnectionPool.getConnection()) {
			PreparedStatement ps = con.prepareStatement("SELECT codice, nome, descrizione, prezzo, peso, pezzi_disponibili,categoria FROM prodotto");
			ArrayList<Prodotto> prodotti = new ArrayList<>();
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Prodotto c = new Prodotto();
				c.setCodice(rs.getInt(1));
				c.setNome(rs.getString(2));
				c.setDescrizione(rs.getString(3));
				c.setPrezzo(rs.getDouble(4));
				c.setPeso(rs.getDouble(5));
				c.setPezzi_disponibili(rs.getInt(6));
				c.setCategoria(rs.getString(7));
				
				prodotti.add(c);
			}
			return prodotti;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public List<Prodotto> doRetrieveByCategoria(String cat) {
		try (Connection con = DBConnectionPool.getConnection()) {
			PreparedStatement ps = con.prepareStatement("SELECT codice, nome, descrizione, prezzo, peso, pezzi_disponibili,categoria FROM prodotto WHERE categoria=?");
			ps.setString(1, cat);
			ArrayList<Prodotto> prodotti = new ArrayList<>();
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Prodotto c = new Prodotto();
				c.setCodice(rs.getInt(1));
				c.setNome(rs.getString(2));
				c.setDescrizione(rs.getString(3));
				c.setPrezzo(rs.getDouble(4));
				c.setPeso(rs.getDouble(5));
				c.setPezzi_disponibili(rs.getInt(6));
				c.setCategoria(rs.getString(7));
				
				prodotti.add(c);
			}
			return prodotti;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public Prodotto doRetrieveByID(int cod) {
		try (Connection con = DBConnectionPool.getConnection()) {
			PreparedStatement ps = con.prepareStatement("SELECT codice, nome, descrizione, prezzo, peso, pezzi_disponibili,categoria FROM prodotto WHERE codice=?");
			ps.setInt(1, cod);
			ResultSet rs = ps.executeQuery();
			Prodotto c = null;
			while (rs.next()) {
				c = new Prodotto();
				c.setCodice(rs.getInt(1));
				c.setNome(rs.getString(2));
				c.setDescrizione(rs.getString(3));
				c.setPrezzo(rs.getDouble(4));
				c.setPeso(rs.getDouble(5));
				c.setPezzi_disponibili(rs.getInt(6));
				c.setCategoria(rs.getString(7));
			}
			return c;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public List<Prodotto> doRetrieveByNomeLike(String str) {
		try (Connection con = DBConnectionPool.getConnection()) {
			PreparedStatement ps = con.prepareStatement("SELECT codice, nome, descrizione, prezzo, peso, pezzi_disponibili,categoria FROM prodotto WHERE nome LIKE ?");
			ps.setString(1, str + '%');
			ArrayList<Prodotto> prodotti = new ArrayList<>();
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Prodotto c = new Prodotto();
				c.setCodice(rs.getInt(1));
				c.setNome(rs.getString(2));
				c.setDescrizione(rs.getString(3));
				c.setPrezzo(rs.getDouble(4));
				c.setPeso(rs.getDouble(5));
				c.setPezzi_disponibili(rs.getInt(6));
				c.setCategoria(rs.getString(7));
				
				prodotti.add(c);
			}
			return prodotti;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void doSave(Prodotto prodotto) throws SQLIntegrityConstraintViolationException {
		try (Connection con = DBConnectionPool.getConnection()) {
			PreparedStatement ps = con.prepareStatement("INSERT INTO prodotto (nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) VALUES(?,?,?,?,?,?)",
					Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, prodotto.getNome());
			ps.setString(2, prodotto.getDescrizione());
			ps.setDouble(3, prodotto.getPrezzo());
			ps.setDouble(4, prodotto.getPeso());
			ps.setInt(5, prodotto.getPezzi_disponibili());
			ps.setString(6, prodotto.getCategoria());
			if (ps.executeUpdate() != 1) {
				throw new RuntimeException("INSERT error.");
			}
			con.commit();
		} catch (SQLIntegrityConstraintViolationException e) {
	        throw e;
	    } catch (SQLException e) {
	    	throw new RuntimeException(e);
	    }
	}

	public void doUpdate(Prodotto prodotto) {
		try (Connection con = DBConnectionPool.getConnection()) {
			PreparedStatement ps = con.prepareStatement("UPDATE prodotto SET nome=?, descrizione=?, prezzo=?, peso=?, pezzi_disponibili=?, categoria=? WHERE codice=?");
			ps.setString(1, prodotto.getNome());
			ps.setString(2, prodotto.getDescrizione());
			ps.setDouble(3, prodotto.getPrezzo());
			ps.setDouble(4, prodotto.getPeso());
			ps.setInt(5, prodotto.getPezzi_disponibili());
			ps.setString(6, prodotto.getCategoria());
			ps.setInt(7, prodotto.getCodice());
			if (ps.executeUpdate() != 1) {
				throw new RuntimeException("UPDATE error.");
			}
			con.commit();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void doDelete(int codice) {
		try (Connection con = DBConnectionPool.getConnection()) {
			PreparedStatement ps = con.prepareStatement("DELETE FROM prodotto WHERE codice=?");
			ps.setInt(1, codice);
			if (ps.executeUpdate() != 1) {
				throw new RuntimeException("DELETE error.");
			}
			con.commit();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
