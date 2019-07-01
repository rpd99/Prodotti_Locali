package ecommerce.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javafx.scene.chart.PieChart.Data;

public class OrdineDAO {

	public List<Ordine> doRetrieveAll() {
		try (Connection con = DBConnectionPool.getConnection()) {
			PreparedStatement ps = con.prepareStatement("SELECT codice, dataOrdine, ind_sped, stato, data_spedizione, cliente, prezzo FROM ordine");
			ArrayList<Ordine> ordini = new ArrayList<>();
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Ordine c = new Ordine();
				c.setCliente(rs.getString(6));
				c.setCodice(Integer.parseInt(rs.getString(1)));
				c.setData_spedizione(LocalDate.parse(rs.getString(5)));
				c.setDataOrdine(LocalDate.parse(rs.getString(2)));
				c.setInd_sped(rs.getString(3));
				c.setPrezzo(Float.parseFloat(rs.getString(7)));
				c.setStato(rs.getString(4));
				
				ordini.add(c);
			}
			return ordini;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public List<Ordine> doRetrieveByCliente(String email) {
		try (Connection con = DBConnectionPool.getConnection()) {
			PreparedStatement ps = con.prepareStatement("SELECT codice, dataOrdine, ind_sped, stato, data_spedizione, cliente, prezzo FROM ordine WHERE cliente=?");
			ps.setString(1, email);
			ArrayList<Ordine> ordini = new ArrayList<>();
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Ordine c = new Ordine();
				c.setCliente(rs.getString(6));
				c.setCodice(Integer.parseInt(rs.getString(1)));
				c.setData_spedizione(LocalDate.parse(rs.getString(5)));
				c.setDataOrdine(LocalDate.parse(rs.getString(2)));
				c.setInd_sped(rs.getString(3));
				c.setPrezzo(Float.parseFloat(rs.getString(7)));
				c.setStato(rs.getString(4));
				
				ordini.add(c);
			}
			return ordini;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void doSave(Ordine ordine) {
		try (Connection con = DBConnectionPool.getConnection()) {
			PreparedStatement ps = con.prepareStatement("INSERT INTO ordine (dataOrdine, ind_sped, stato, data_spedizione, cliente, prezzo) VALUES(?,?,?,?,?,?)",
					Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, ordine.getDataOrdine().toString());
			ps.setString(2, ordine.getInd_sped());
			ps.setString(3, ordine.getStato());
			ps.setString(4, ordine.getData_spedizione().toString());
			ps.setString(5, ordine.getCliente());
			ps.setFloat(6, ordine.getPrezzo());
			if (ps.executeUpdate() != 1) {
				throw new RuntimeException("INSERT error.");
			}
			con.commit();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
