package ecommerce.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ecommerce.model.Carrello;
import ecommerce.model.CategoriaDAO;
import ecommerce.model.Ordine;
import ecommerce.model.OrdineDAO;
import ecommerce.model.OrdineProdotto;
import ecommerce.model.OrdineProdottoDAO;
import ecommerce.model.Prodotto;
import ecommerce.model.ProdottoDAO;
import ecommerce.model.ProdottoQuantita;
import ecommerce.model.Utente;
import ecommerce.utils.Validator;

@WebServlet("/Acquisto")
public class Acquisto extends HttpServlet {
	private static final long serialVersionUID = 1L;

	ProdottoDAO model = new ProdottoDAO();
	static ProdottoDAO modelProdotto = new ProdottoDAO();
	static CategoriaDAO modelCategoria = new CategoriaDAO();
	static OrdineDAO modelOrdine = new OrdineDAO();
	static OrdineProdottoDAO modelOrdineProdotto = new OrdineProdottoDAO();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Utente u = (Utente) request.getSession().getAttribute("utente");
		if(u==null || u.getIs_Admin() != 0) {
			response.sendRedirect("./login.jsp");
			return;
		}
		
		Utente cliente = (Utente) request.getSession().getAttribute("utente");
		Carrello cart = (Carrello) request.getSession().getAttribute("carrello");
		int flag=0;
		if(cart == null) {
			cart = new Carrello();
			request.getSession().setAttribute("carrello", cart);
		}
				
		String action = request.getParameter("action");
		
		
		try {
			if(action != null) {
				if(action.equalsIgnoreCase("buy")) {
					LocalDate dataOrdine = LocalDate.now();
					String stato = "1";
					String nome = request.getParameter("nome");
					String cognome = request.getParameter("cognome");
					String indirizzo = request.getParameter("indirizzo");
					String numero = request.getParameter("numero");
					
					if(!Validator.isValidString(nome)) {
						request.setAttribute("formError","Errore nome");
						flag=1;						
					}
					if(!Validator.isValidString(cognome)) {
						request.setAttribute("formError","Errore cognome");
						flag=1;
					}
					if(!Validator.isValidTelephone(numero)) {
						request.setAttribute("formError","Errore numero di telefono");
						flag=1;
					}
					if(cart.getSize()==0) {
						request.setAttribute("formError","Non e' stato possibile effettuare l'acquisto");
						flag=1;
					}
					for(ProdottoQuantita prod: (cart.getProdotti())){
						Prodotto p = (Prodotto)modelProdotto.doRetrieveByID(prod.getProdotto().getCodice());
						if(p.getPezzi_disponibili()<prod.getQuantita()) {
							request.setAttribute("formError","Non e' stato possibile effettuare l'acquisto");
							flag=1;
							cart.aggiornaProdotto(prod.getProdotto(), p.getPezzi_disponibili());
						}
					}
					
					if(flag!=1) {
						float prezzo=0;
						for(ProdottoQuantita prod: (cart.getProdotti())){
							prezzo += prod.getQuantita() * prod.getProdotto().getPrezzo();
						}
						
						Ordine ordine = new Ordine(0, dataOrdine, indirizzo, stato, dataOrdine, prezzo, cliente.getEmail());
						modelOrdine.doSave(ordine);
						
						ArrayList<Ordine> ordini = (ArrayList<Ordine>) modelOrdine.doRetrieveAll();
						ordine = ordini.get(ordini.size()-1);
						
						for(ProdottoQuantita prodq: cart.getProdotti()) {
							System.out.println(prodq.getProdotto().getNome() + prodq.getQuantita());
							OrdineProdotto op = new OrdineProdotto(ordine, prodq.getProdotto(), prodq.getQuantita());						
							modelOrdineProdotto.doSave(op);
							
							Prodotto p = new Prodotto();
							p.setCodice(prodq.getProdotto().getCodice());
							p.setCategoria(prodq.getProdotto().getCategoria());
							p.setDescrizione(prodq.getProdotto().getDescrizione());
							p.setNome(prodq.getProdotto().getNome());
							p.setPeso(prodq.getProdotto().getPeso());
							p.setPezzi_disponibili(prodq.getProdotto().getPezzi_disponibili()-prodq.getQuantita());
							p.setPrezzo(prodq.getProdotto().getPrezzo());
							
							modelProdotto.doUpdate(p);
						}
						
						request.getSession().setAttribute("carrello", new Carrello());
						request.setAttribute("formSuccess","Acquisto effettuato con successo");
					}
				}
			}
		} catch(NumberFormatException e) {
			System.out.println("Error: " + e.getMessage());
			request.setAttribute("error", e.getMessage());
		}

		
		request.removeAttribute("categories");
		request.setAttribute("categories", modelCategoria.doRetrieveAll());
				
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/clienteFilter/acquisto.jsp");
		dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
