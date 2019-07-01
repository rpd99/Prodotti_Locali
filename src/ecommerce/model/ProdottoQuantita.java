package ecommerce.model;

public class ProdottoQuantita {

	private Prodotto prodotto;
	private int quantita;
	
	public ProdottoQuantita(Prodotto prodotto, int quantita) {
		this.prodotto = prodotto;
		this.quantita = quantita;
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
	public boolean isSameProduct(Prodotto prod) {
		if (prodotto.getCodice() == prod.getCodice())
			return true;
		else
			return false;
	}
}
