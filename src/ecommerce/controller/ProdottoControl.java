package ecommerce.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ecommerce.model.Categoria;
import ecommerce.model.CategoriaDAO;
import ecommerce.model.ProdottoDAO;


@WebServlet("/ProdottoControl")
public class ProdottoControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	static CategoriaDAO modelCategoria = new CategoriaDAO();
	static ProdottoDAO modelProdotto = new ProdottoDAO();
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cat = request.getParameter("cat");
		
		request.removeAttribute("categories");
		ArrayList<Categoria> categories = (ArrayList<Categoria>) modelCategoria.doRetrieveAll(); 
		request.setAttribute("categories", categories);
		
		for(Categoria categoria: (ArrayList<Categoria>) categories)
			if(categoria.getNome().equals(cat))
				request.setAttribute("description", categoria.getDescrizione());
		
		request.removeAttribute("products");
		if(cat.contentEquals("tutte"))
			request.setAttribute("products", modelProdotto.doRetrieveAll());
		else {
			request.setAttribute("products", modelProdotto.doRetrieveByCategoria(cat));
		}

		RequestDispatcher dispatcher;
		dispatcher = this.getServletContext().getRequestDispatcher("/categoria-prodotto.jsp");
		dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
