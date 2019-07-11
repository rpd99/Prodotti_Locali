package ecommerce.controller;

import java.io.IOException;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ecommerce.model.Utente;
import ecommerce.model.UtenteDAO;
import ecommerce.utils.Validator;



@WebServlet("/LoginRegister")
public class LoginRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UtenteDAO utenteDAO = new UtenteDAO(); 
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String nome = request.getParameter("nome");
		String cognome = request.getParameter("cognome");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String password2 = request.getParameter("password2");		
		
		RequestDispatcher requestDispatcher = null;
		if(!Validator.isValidString(nome)) {
			request.setAttribute("formError","Errore nome");
			requestDispatcher = request.getRequestDispatcher("/registrazioneForm.jsp");
			requestDispatcher.forward(request, response);
			return;
		}
		if(!Validator.isValidString(cognome)) {
			request.setAttribute("formError","Errore cognome");
			requestDispatcher = request.getRequestDispatcher("/registrazioneForm.jsp");
			requestDispatcher.forward(request, response);
			return;
		}
		if(!Validator.isValidEmail(email)) {
			request.setAttribute("formError","Errore email");
			requestDispatcher = request.getRequestDispatcher("/registrazioneForm.jsp");
			requestDispatcher.forward(request, response);
			return;
		}
		if(!Validator.isValidPassword(password) || !(password.equals(password2))) {
			request.setAttribute("formError","Errore password");
			requestDispatcher = request.getRequestDispatcher("/registrazioneForm.jsp");
			requestDispatcher.forward(request, response);
			return;
		}
		if(request.getParameter("checkbox")==null){
			request.setAttribute("formError","Accettare normativa password");
			requestDispatcher = request.getRequestDispatcher("/registrazioneForm.jsp");
			requestDispatcher.forward(request, response);
			return;
		}
		
		Utente utente = new Utente();
		utente.setNome(nome);
		utente.setCognome(cognome);
		utente.setEmail(email);
		utente.setPassword_utente(password);
		utente.setIs_Admin(0);
		
		if(utenteDAO.doRetrieveByID(email) != null) {
			request.setAttribute("formError", "Email già presente");
			requestDispatcher = request.getRequestDispatcher("/registrazioneForm.jsp");
			requestDispatcher.forward(request, response);
			return;
		}
		
		utenteDAO.doSave(utente);
		
		request.setAttribute("successMessage", "Registrazione effettuata con succcesso. Accedi per continuare");
		
		requestDispatcher = request.getRequestDispatcher("/login.jsp");
		requestDispatcher.forward(request, response);
	}
	
	

}
