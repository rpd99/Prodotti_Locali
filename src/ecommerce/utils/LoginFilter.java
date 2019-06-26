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

@WebServlet("/LoginFilter")
public class LoginFilter extends HttpServlet {

	private final UtenteDAO utenteDAO = new UtenteDAO();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			Utente u=new Utente();
			if (username != null && password != null) {
				u = utenteDAO.doRetrieveByEmailPassword(username, password);
			}

			if (u == null) {
				try {
					throw new Exception("Username e/o password non validi.");
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			request.getSession().setAttribute("utente", u);

			response.sendRedirect("/index.jsp");
	}
	private static final long serialVersionUID = 1L;

	public LoginFilter() {
		super();
	}	

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	

}
