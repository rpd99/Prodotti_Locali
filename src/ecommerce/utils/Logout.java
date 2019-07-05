package ecommerce.utils;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ecommerce.model.Utente;
import ecommerce.model.UtenteDAO;

@WebServlet("/Logout")
public class Logout extends HttpServlet {

	private final UtenteDAO utenteDAO = new UtenteDAO();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			Utente u = (Utente) request.getSession().getAttribute("utente");
			if(u != null) {
				request.getSession().removeAttribute("utente");
				request.getSession().removeAttribute("carrello");
			}
			response.sendRedirect("./index.jsp");
	}
	private static final long serialVersionUID = 1L;

	public Logout() {
		super();
	}	

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	

}
