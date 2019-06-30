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
import ecommerce.model.Prodotto;
import ecommerce.model.ProdottoDAO;

@WebServlet("/CarrelloControl")
public class CarrelloControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	ProdottoDAO model = new ProdottoDAO();
	static ProdottoDAO modelProdotto = new ProdottoDAO();
	static CategoriaDAO modelCategoria = new CategoriaDAO();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Carrello cart = (Carrello) request.getSession().getAttribute("carrello");
		if(cart == null) {
			cart = new Carrello();
			request.getSession().setAttribute("carrello", cart);
		}
				
		String action = request.getParameter("action");
		
		
		try {
			if(action != null) {
				int id = Integer.parseInt(request.getParameter("id"));
				int quantita = Integer.parseInt(request.getParameter("quantita"));
				Prodotto bean = model.doRetrieveByID(id);
				if(action.equalsIgnoreCase("addCart")) {
					if(bean != null) {
						cart.aggiungiProdotto(bean, quantita);
					}
				} else if(action.equalsIgnoreCase("deleteCart")) {
					if(bean != null) {
						cart.rimuoviProdotto(bean);
					}
				} else if(action.equalsIgnoreCase("updateCart")) {
					if(bean != null) {
						cart.aggiornaProdotto(bean, quantita);
					}
				}
			}
		} catch(NumberFormatException e) {
			System.out.println("Error: " + e.getMessage());
			request.setAttribute("error", e.getMessage());
		}
		
		request.getSession().setAttribute("carrello", cart);
		request.setAttribute("cart", cart);
		
		request.removeAttribute("categories");
		request.setAttribute("categories", modelCategoria.doRetrieveAll());
		
		request.removeAttribute("products");
		request.setAttribute("products", modelProdotto.doRetrieveAll());
				
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/carrello.jsp");
		dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
