
package ecommerce.model;


public class OrdineProdotto {
	private Ordine ordine;
	private Prodotto prodotto;
	private int quantita;
	
	public OrdineProdotto() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	
	public OrdineProdotto(Ordine ordine, Prodotto prodotto, int quantita) {
		super();
		this.ordine = ordine;
		this.prodotto = prodotto;
		this.quantita = quantita;
	}



	public Ordine getOrdine() {
		return ordine;
	}

	public void setOrdine(Ordine ordine) {
		this.ordine = ordine;
	}

	public Prodotto getProdotto() {
		return prodotto;
	}

	public void setProdotto(Prodotto prodotto) {
		this.prodotto = prodotto;
	}

	public int getQuantita() {
		return quantita;
	}

	public void setQuantita(int quantita) {
		this.quantita = quantita;
	}
	
	
}
