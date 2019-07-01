package ecommerce.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class OrdineProdottoDAO {

	public List<OrdineProdotto> doRetrieveAll() {
		try (Connection con = DBConnectionPool.getConnection()) {
			PreparedStatement ps = con.prepareStatement("SELECT * FROM relativo, ordine, prodotto WHERE relativo.ordine=ordine.codice AND relativo.prodotto=prodotto.codice");
			ArrayList<OrdineProdotto> ordProd = new ArrayList<>();
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {				
				Prodotto p = new Prodotto();
				p.setCodice(rs.getInt("codice"));
				p.setNome(rs.getString("nome"));
				p.setDescrizione(rs.getString("descrizione"));
				p.setPrezzo(rs.getDouble("prezzo"));
				p.setPeso(rs.getDouble("peso"));
				p.setPezzi_disponibili(rs.getInt("pezzi_disponibili"));
				p.setCategoria(rs.getString("categoria"));
				
				Ordine o = new Ordine();
				o.setCliente(rs.getString("cliente"));
				o.setCodice(Integer.parseInt(rs.getString("codice")));
				o.setData_spedizione(LocalDate.parse(rs.getString("data_spedizione")));
				o.setDataOrdine(LocalDate.parse(rs.getString("dataOrdine")));
				o.setInd_sped(rs.getString("ind_sped"));
				o.setPrezzo(Float.parseFloat(rs.getString("prezzo")));
				o.setStato(rs.getString("stato"));
							
				OrdineProdotto c = new OrdineProdotto();
				c.setOrdine(o);
				c.setProdotto(p);
				c.setQuantita(rs.getInt("quantita"));
				
				ordProd.add(c);
			}
			return ordProd;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public List<OrdineProdotto> doRetrieveByCliente(Utente u) {
		try (Connection con = DBConnectionPool.getConnection()) {
			PreparedStatement ps = con.prepareStatement("SELECT * FROM relativo, ordine, prodotto WHERE relativo.ordine=ordine.codice AND relativo.prodotto=prodotto.codice AND ordine.cliente=?");
			ps.setString(1, u.getEmail());
			ArrayList<OrdineProdotto> ordProd = new ArrayList<>();
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Prodotto p = new Prodotto();
				p.setCodice(rs.getInt("codice"));
				p.setNome(rs.getString("nome"));
				p.setDescrizione(rs.getString("descrizione"));
				p.setPrezzo(rs.getDouble("prezzo"));
				p.setPeso(rs.getDouble("peso"));
				p.setPezzi_disponibili(rs.getInt("pezzi_disponibili"));
				p.setCategoria(rs.getString("categoria"));
				
				Ordine o = new Ordine();
				o.setCliente(rs.getString("cliente"));
				o.setCodice(Integer.parseInt(rs.getString("codice")));
				o.setData_spedizione(LocalDate.parse(rs.getString("data_spedizione")));
				o.setDataOrdine(LocalDate.parse(rs.getString("dataOrdine")));
				o.setInd_sped(rs.getString("ind_sped"));
				o.setPrezzo(Float.parseFloat(rs.getString("prezzo")));
				o.setStato(rs.getString("stato"));
							
				OrdineProdotto c = new OrdineProdotto();
				c.setOrdine(o);
				c.setProdotto(p);
				c.setQuantita(rs.getInt("quantita"));
				
				ordProd.add(c);
			}
			return ordProd;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public void doSave(OrdineProdotto op) {
		try (Connection con = DBConnectionPool.getConnection()) {
			System.out.println("prova"+op.getQuantita());
			PreparedStatement ps = con.prepareStatement("INSERT INTO relativo (quantita, ordine, prodotto) VALUES(?,?,?)", Statement.RETURN_GENERATED_KEYS);
			
			ps.setInt(1, op.getQuantita());
			ps.setInt(2, op.getOrdine().getCodice());
			ps.setInt(3, op.getProdotto().getCodice());
			if (ps.executeUpdate() != 1) {
				throw new RuntimeException("INSERT error.");
			}
			con.commit();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

}
