
package ecommerce.model;


public class Prodotto {
	private int codice;
	private String nome;
	private String descrizione;
	private double prezzo;
	private double peso;
	private int pezzi_disponibili;
	private String categoria;
	
	public Prodotto() {
		super();
	}
	
	public Prodotto(int codice, String nome, String descrizione, double prezzo, double peso, int pezzi_disponibili,
			String categoria) {
		super();
		this.codice = codice;
		this.nome = nome;
		this.descrizione = descrizione;
		this.prezzo = prezzo;
		this.peso = peso;
		this.pezzi_disponibili = pezzi_disponibili;
		this.categoria = categoria;
	}
	
	public int getCodice() {
		return codice;
	}
	public void setCodice(int codice) {
		this.codice = codice;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getDescrizione() {
		return descrizione;
	}
	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}
	public double getPrezzo() {
		return prezzo;
	}
	public void setPrezzo(double prezzo) {
		this.prezzo = prezzo;
	}
	public double getPeso() {
		return peso;
	}
	public void setPeso(double peso) {
		this.peso = peso;
	}
	public int getPezzi_disponibili() {
		return pezzi_disponibili;
	}
	public void setPezzi_disponibili(int pezzi_disponibili) {
		this.pezzi_disponibili = pezzi_disponibili;
	}
	public String getCategoria() {
		return categoria;
	}
	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}

	public String toString() {
		return "Prodotto [codice=" + codice + ", nome=" + nome + ", descrizione=" + descrizione + ", prezzo=" + prezzo
				+ ", peso=" + peso + ", pezzi_disponibili=" + pezzi_disponibili + ", categoria=" + categoria + "]";
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Prodotto other = (Prodotto) obj;
		if (categoria == null) {
			if (other.categoria != null)
				return false;
		} else if (!categoria.equals(other.categoria))
			return false;
		if (codice != other.codice)
			return false;
		if (descrizione == null) {
			if (other.descrizione != null)
				return false;
		} else if (!descrizione.equals(other.descrizione))
			return false;
		if (nome == null) {
			if (other.nome != null)
				return false;
		} else if (!nome.equals(other.nome))
			return false;
		if (Double.doubleToLongBits(peso) != Double.doubleToLongBits(other.peso))
			return false;
		if (pezzi_disponibili != other.pezzi_disponibili)
			return false;
		if (Double.doubleToLongBits(prezzo) != Double.doubleToLongBits(other.prezzo))
			return false;
		return true;
	}
	
	
	

}
