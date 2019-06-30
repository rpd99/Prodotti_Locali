package ecommerce.model;

import java.util.ArrayList;

public class Carrello {

	private ArrayList<ProdottoQuantita> prodotti;
	
	public Carrello() {
		this.prodotti = new ArrayList<ProdottoQuantita>();
	}
	
	public void aggiungiProdotto(Prodotto prod, int quant) {
		int flag=0;
		for (ProdottoQuantita p : prodotti) {
			if (p.isSameProduct(prod)) {
				p.setQuantita(p.getQuantita()+quant);
				flag=1;
			}
		}
		
		if (flag==0)
			prodotti.add(new ProdottoQuantita(prod.getCodice(), quant));
	}
	

	public void aggiornaProdotto(Prodotto prod, int quant) {
		for (ProdottoQuantita p : prodotti) {
			if (p.isSameProduct(prod))
				p.setQuantita(quant);
		}
	}
	
	public void rimuoviProdotto(Prodotto prod) {
		for (int i=0; i<prodotti.size(); i++) {
			if (prodotti.get(i).getProdotto() == prod.getCodice())
				prodotti.remove(i);
		}
	}
	
	public int getSize() {
		return prodotti.size();
	}
	
	public ArrayList<ProdottoQuantita> getProdotti(){
		return prodotti;
	}
}
