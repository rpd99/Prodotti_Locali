package ecommerce.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ecommerce.model.CategoriaDAO;

@WebServlet("/CategoriaControlChiSiamo")
public class CategoriaControlChiSiamo extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	static CategoriaDAO modelCategoria = new CategoriaDAO();
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.removeAttribute("categories");
		request.setAttribute("categories", modelCategoria.doRetrieveAll());
		
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/chiSiamo.jsp");
		dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
