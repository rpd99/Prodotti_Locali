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

@WebServlet("/MioProfilo")
public class MioProfilo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	static CategoriaDAO modelCategoria = new CategoriaDAO();
	static OrdineProdottoDAO modelOrdineProdotto = new OrdineProdottoDAO();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Utente cliente = (Utente) request.getSession().getAttribute("utente");
		Carrello cart = (Carrello) request.getSession().getAttribute("carrello");
		if(cart == null) {
			cart = new Carrello();
			request.getSession().setAttribute("carrello", cart);
		}	
		
		request.setAttribute("ordini",modelOrdineProdotto.doRetrieveByCliente(cliente));
		
		request.removeAttribute("categories");
		request.setAttribute("categories", modelCategoria.doRetrieveAll());
				
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/clienteFilter/mio-profilo.jsp");
		dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
