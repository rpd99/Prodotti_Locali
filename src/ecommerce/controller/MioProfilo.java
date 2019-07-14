package ecommerce.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ecommerce.model.Carrello;
import ecommerce.model.CategoriaDAO;
import ecommerce.model.OrdineDAO;
import ecommerce.model.OrdineProdottoDAO;
import ecommerce.model.Prodotto;
import ecommerce.model.ProdottoDAO;
import ecommerce.model.Utente;
import ecommerce.model.UtenteDAO;
import ecommerce.utils.Validator;

@WebServlet("/MioProfilo")
public class MioProfilo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	static CategoriaDAO modelCategoria = new CategoriaDAO();
	static OrdineProdottoDAO modelOrdineProdotto = new OrdineProdottoDAO();
	static OrdineDAO modelOrdine = new OrdineDAO();
	static UtenteDAO modelUtente = new UtenteDAO();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Utente cliente = (Utente) request.getSession().getAttribute("utente");
		int flag=0;
		
		String action = request.getParameter("action");
		
		try {
			if(action != null) {
				if(action.equalsIgnoreCase("update")) {
					String vecchiaPassword = request.getParameter("vecchiaPassword");
					String nuovaPassword1 = request.getParameter("nuovaPassword1");
					String nuovaPassword2 = request.getParameter("nuovaPassword2");
					
					if(cliente.getPassword_utente().equals(vecchiaPassword)) {
						if(nuovaPassword1.equals(nuovaPassword2)) {
							if(Validator.isValidPassword(nuovaPassword1)) {
								cliente.setPassword_utente(nuovaPassword1);
								modelUtente.doUpdate(cliente);
								request.setAttribute("formSuccess","Password aggiornata con successo");
							} else { 
								request.setAttribute("formError","Errore formato password");
							}
						} else {
							request.setAttribute("formError","Le due password inserite sono diverse");		
						}
					} else {
						request.setAttribute("formError","Password vecchia errata");
					}
					
				} 
			}
		} catch(NumberFormatException e) {
			System.out.println("Error: " + e.getMessage());
			request.setAttribute("error", e.getMessage());
		}
		
		request.setAttribute("ordini",modelOrdine.doRetrieveByCliente(cliente.getEmail()));
		
		request.removeAttribute("categories");
		request.setAttribute("categories", modelCategoria.doRetrieveAll());
				
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/clienteFilter/mio-profilo.jsp");
		dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
