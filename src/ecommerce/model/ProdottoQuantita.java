package ecommerce.model;

public class ProdottoQuantita {

	private int prodotto;
	private int quantita;
	
	public ProdottoQuantita(int prodotto, int quantita) {
		this.prodotto = prodotto;
		this.quantita = quantita;
	}

	public int getProdotto() {
		return prodotto;
	}
	public void setProdotto(int prodotto) {
		this.prodotto = prodotto;
	}
	public int getQuantita() {
		return quantita;
	}
	public void setQuantita(int quantita) {
		this.quantita = quantita;
	}
	public boolean isSameProduct(Prodotto prod) {
		if (prodotto == prod.getCodice())
			return true;
		else
			return false;
	}
}
