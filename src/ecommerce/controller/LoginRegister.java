package ecommerce.controller;

import java.io.IOException;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ecommerce.model.Utente;
import ecommerce.model.UtenteDAO;



@WebServlet("/LoginRegister")
public class LoginRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UtenteDAO utenteDAO = new UtenteDAO(); 
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String nome = request.getParameter("nome");
		String cognome = request.getParameter("cognome");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		Utente utente = new Utente();
		utente.setNome(nome);
		utente.setCognome(cognome);
		utente.setEmail(email);
		utente.setPassword_utente(password);
		utente.setIs_Admin(0);
		
		if(utenteDAO.doRetrieveByID(email) != null) {
			request.setAttribute("errorMessage", "Email già presente");
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("/registrazioneForm.jsp");
			requestDispatcher.forward(request, response);
		}
		
		utenteDAO.doSave(utente);
		
		request.setAttribute("successMessage", "Registrazione effettuata con succcesso. Accedi per continuare");
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/login.jsp");
		requestDispatcher.forward(request, response);
	}
	
	

}
