package ecommerce.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ecommerce.model.UtenteDAO;

/**
 * Servlet implementation class VerificaUsername
 */
@WebServlet("/VerificaUsername")
public class VerificaUsername extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final UtenteDAO utenteDAO = new UtenteDAO();
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		response.setContentType("text/xml");
		if ( utenteDAO.doRetrieveByID(email) == null) {
			System.out.println(email);
			response.getWriter().append("<ok/>");
		} else {
			response.getWriter().append("<no/>");
		}
	}

}
