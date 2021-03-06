package ecommerce.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ecommerce.model.Utente;
import ecommerce.model.UtenteDAO;

//@WebServlet("/Login")
public class Login extends HttpServlet {

	private final UtenteDAO utenteDAO = new UtenteDAO();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			Utente u=new Utente();
			if (username != null && password != null) {
				u = utenteDAO.doRetrieveByEmailPassword(username, password);
			}
			
			request.getSession().setAttribute("utente", u);
			
			if (u == null) {
				request.setAttribute("formError", "Email o password non esistenti.");
				this.getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
			} else if (u.getIs_Admin()==1) {
				response.sendRedirect("./adminFilter/gestioneSito.jsp");
			} else {
				response.sendRedirect("./index.jsp");
			}
	}
	private static final long serialVersionUID = 1L;

	public Login() {
		super();
	}	

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	

}
