package ecommerce.model;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;

public class Ordine {

	private int codice;
	private LocalDate dataOrdine;
	private String ind_sped;
	private String stato;
	private LocalDate data_spedizione;
	private float prezzo;
	private String cliente;
	
	public Ordine() {
		super();
	}

	public Ordine(int codice, LocalDate dataOrdine, String ind_sped, String stato, LocalDate data_spedizione, float prezzo,
			String cliente) {
		super();
		this.codice = codice;
		this.dataOrdine = dataOrdine;
		this.ind_sped = ind_sped;
		this.stato = stato;
		this.data_spedizione = data_spedizione;
		this.prezzo = prezzo;
		this.cliente = cliente;
	}
	public int getCodice() {
		return codice;
	}
	public void setCodice(int codice) {
		this.codice = codice;
	}
	public LocalDate getDataOrdine() {
		return dataOrdine;
	}
	public void setDataOrdine(LocalDate dataOrdine) {
		this.dataOrdine = dataOrdine;
	}
	public String getInd_sped() {
		return ind_sped;
	}
	public void setInd_sped(String ind_sped) {
		this.ind_sped = ind_sped;
	}
	public String getStato() {
		return stato;
	}
	public void setStato(String stato) {
		this.stato = stato;
	}
	public LocalDate getData_spedizione() {
		return data_spedizione;
	}
	public void setData_spedizione(LocalDate data_spedizione) {
		this.data_spedizione = data_spedizione;
	}
	public float getPrezzo() {
		return prezzo;
	}
	public void setPrezzo(float prezzo) {
		this.prezzo = prezzo;
	}
	public String getCliente() {
		return cliente;
	}
	public void setCliente(String cliente) {
		this.cliente = cliente;
	}
	
}
