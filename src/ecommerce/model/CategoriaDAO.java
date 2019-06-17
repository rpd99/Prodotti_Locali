package ecommerce.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class CategoriaDAO {

	public List<Categoria> doRetrieveAll() {
		try (Connection con = DBConnectionPool.getConnection()) {
			PreparedStatement ps = con.prepareStatement("SELECT nome, descrizione FROM categoria");
			ArrayList<Categoria> categorie = new ArrayList<>();
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Categoria c = new Categoria();
				c.setNome(rs.getString(1));
				c.setDescrizione(rs.getString(2));
				categorie.add(c);
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
