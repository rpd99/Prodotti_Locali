package ecommerce.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ecommerce.model.Categoria;
import ecommerce.model.CategoriaDAO;
import ecommerce.model.ProdottoDAO;


@WebServlet("/ProdottoControlAdmin")
public class ProdottoControlAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	static CategoriaDAO modelCategoria = new CategoriaDAO();
	static ProdottoDAO modelProdotto = new ProdottoDAO();
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		
		try {
			if(action != null) {
				if(action.equalsIgnoreCase("update")) {
					String nome = request.getParameter("nome");
					String descrizione = request.getParameter("descrizione");
					
					Categoria bean = new Categoria();
					bean.setNome(nome);
					bean.setDescrizione(descrizione);
					
					modelCategoria.doUpdate(bean);
				} 
			}
		}  catch(NumberFormatException e) {
			System.out.println("Error: " + e.getMessage());
			request.setAttribute("error", e.getMessage());
		}
		
		
		
		request.removeAttribute("categories");
		request.setAttribute("categories", modelCategoria.doRetrieveAll());
		
		
		request.removeAttribute("products");
		String cat = request.getParameter("cat");
		if(cat.contentEquals("tutte"))
			request.setAttribute("products", modelProdotto.doRetrieveAll());
		else
			request.setAttribute("products", modelProdotto.doRetrieveByCategoria(cat));

		RequestDispatcher dispatcher;
		dispatcher = this.getServletContext().getRequestDispatcher("/adminFilter/categoria-prodotto-admin.jsp");
		dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
