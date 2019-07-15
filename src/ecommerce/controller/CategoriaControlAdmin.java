package ecommerce.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ecommerce.controller.ProdottoControlAdmin.state;
import ecommerce.model.Categoria;
import ecommerce.model.CategoriaDAO;
import ecommerce.model.Utente;
import ecommerce.utils.PhotoControl;

@WebServlet("/CategoriaControlAdmin")
public class CategoriaControlAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	static CategoriaDAO modelCategoria = new CategoriaDAO();
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Utente u = (Utente) request.getSession().getAttribute("utente");
		if(u==null || u.getIs_Admin() != 1) {
			response.sendRedirect("./login.jsp");
			return;
		}
		
		String action = request.getParameter("action");
		int flag=0;
		
		try {
			if(action != null) {
				if(action.equalsIgnoreCase("insert")) {
					String nome = request.getParameter("nome");
					String descrizione = request.getParameter("descrizione");
					
					Categoria bean = new Categoria();
					bean.setNome(nome);
					bean.setDescrizione(descrizione);
					
					
					try {
						modelCategoria.doSave(bean);
					} catch (SQLIntegrityConstraintViolationException e) {
						request.setAttribute("formError","Esiste già una categoria con questo nome");
						flag = 1;
					}
					
					String urlPhoto = (String) request.getParameter("urlPhoto");
					if (urlPhoto != null) {
						try {
							PhotoControl.upload(nome, urlPhoto, "categoria", "nome");
						} catch (SQLException e) {
							e.printStackTrace();
						}
					}
					
					if(flag == 0)
						request.setAttribute("formSuccess","Categoria inserita con successo");
					
				} 
			}
		}  catch(NumberFormatException e) {
			System.out.println("Error: " + e.getMessage());
			request.setAttribute("error", e.getMessage());
		}
		
		
		
		
		
		request.removeAttribute("categories");
		request.setAttribute("categories", modelCategoria.doRetrieveAll());
		
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/adminFilter/gestioneSito.jsp");
		dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
