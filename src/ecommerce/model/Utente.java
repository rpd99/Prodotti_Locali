
package ecommerce.model;


public class Utente {
	private String email;
	private String nome;
	private String cognome;
	private String password_utente;
	private int is_Admin;
	
	public Utente() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getCognome() {
		return cognome;
	}
	public void setCognome(String cognome) {
		this.cognome = cognome;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword_utente() {
		return password_utente;
	}
	public void setPassword_utente(String password_utente) {
		this.password_utente = password_utente;
	}
	public int getIs_Admin() {
		return is_Admin;
	}
	public void setIs_Admin(int is_Admin) {
		this.is_Admin = is_Admin;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Utente other = (Utente) obj;
		if (cognome == null) {
			if (other.cognome != null)
				return false;
		} else if (!cognome.equals(other.cognome))
			return false;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (is_Admin != other.is_Admin)
			return false;
		if (nome == null) {
			if (other.nome != null)
				return false;
		} else if (!nome.equals(other.nome))
			return false;
		if (password_utente == null) {
			if (other.password_utente != null)
				return false;
		} else if (!password_utente.equals(other.password_utente))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Utente [nome=" + nome + ", cognome=" + cognome + ", email=" + email + ", password_utente="
				+ password_utente + ", is_Admin=" + is_Admin + "]";
	}

	
}
