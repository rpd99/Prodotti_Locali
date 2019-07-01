package ecommerce.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class OrdineDAO {

	public List<Ordine> doRetrieveAll() {
		try (Connection con = DBConnectionPool.getConnection()) {
			PreparedStatement ps = con.prepareStatement("SELECT codice, dataOrdine, ind_sped, stato, data_spedizione, cliente, prezzo FROM ordine");
			ArrayList<Ordine> ordine = new ArrayList<>();
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Ordine c = new Ordine();
				c.setCliente(rs.getString(6));
				c.setCodice(rs.getString(1));
				c.setData_spedizione(rs.getString(5));
				c.setDataOrdine(rs.getString(2));
				c.setInd_sped(rs.getString(3));
				c.setPrezzo(rs.getString(7));
				c.setStato(rs.getString(4));
			}
			return categorie;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void doSave(Categoria categoria) {
		try (Connection con = DBConnectionPool.getConnection()) {
			PreparedStatement ps = con.prepareStatement("INSERT INTO categoria (nome, descrizione) VALUES(?,?)",
					Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, categoria.getNome());
			ps.setString(2, categoria.getDescrizione());
			if (ps.executeUpdate() != 1) {
				throw new RuntimeException("INSERT error.");
			}
			con.commit();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void doUpdate(Categoria categoria) {
		try (Connection con = DBConnectionPool.getConnection()) {
			PreparedStatement ps = con.prepareStatement("UPDATE categoria SET descrizione=? WHERE nome=?");
			ps.setString(1, categoria.getDescrizione());
			ps.setString(2, categoria.getNome());
			if (ps.executeUpdate() != 1) {
				throw new RuntimeException("UPDATE error.");
			}
			con.commit();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void doDelete(String nome) {
		try (Connection con = DBConnectionPool.getConnection()) {
			PreparedStatement ps = con.prepareStatement("DELETE FROM categoria WHERE nome=?");
			ps.setString(1, nome);
			if (ps.executeUpdate() != 1) {
				throw new RuntimeException("DELETE error.");
			}
			con.commit();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
