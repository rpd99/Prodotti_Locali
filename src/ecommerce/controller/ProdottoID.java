package ecommerce.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ecommerce.model.CategoriaDAO;
import ecommerce.model.ProdottoDAO;

@WebServlet("/ProdottoID")
public class ProdottoID extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	static CategoriaDAO modelCategoria = new CategoriaDAO();
	static ProdottoDAO modelProdotto = new ProdottoDAO();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.removeAttribute("categories");
		request.setAttribute("categories", modelCategoria.doRetrieveAll());
		
		
		request.removeAttribute("products");
		int cod = Integer.parseInt(request.getParameter("cod"));
		request.setAttribute("products", modelProdotto.doRetrieveByID(cod));

		RequestDispatcher dispatcher;
		dispatcher = this.getServletContext().getRequestDispatcher("/prodotto.jsp");
		dispatcher.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
