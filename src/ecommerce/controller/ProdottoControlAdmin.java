package ecommerce.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ecommerce.model.Categoria;
import ecommerce.model.CategoriaDAO;
import ecommerce.model.Prodotto;
import ecommerce.model.ProdottoDAO;
import ecommerce.model.Utente;
import ecommerce.utils.PhotoControl;
import ecommerce.utils.Validator;

@WebServlet("/ProdottoControlAdmin")
public class ProdottoControlAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	enum state {
		  NO_ACTION,
		  INVALID_FORM,
		  ACTION_DELETE
		}
	
	static CategoriaDAO modelCategoria = new CategoriaDAO();
	static ProdottoDAO modelProdotto = new ProdottoDAO();
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Utente u = (Utente) request.getSession().getAttribute("utente");
		if(u==null || u.getIs_Admin() != 1) {
			response.sendRedirect("./login.jsp");
			return;
		}
		
		String action = request.getParameter("action");
		state flag = state.NO_ACTION;
		RequestDispatcher dispatcher = null;
		String cat = request.getParameter("cat");
		
		try {
			if(action != null) {
				if(action.equalsIgnoreCase("update")) {
					String nome = request.getParameter("nome");
					String descrizione = request.getParameter("descrizione");
					
					Categoria bean = new Categoria();
					bean.setNome(nome);
					bean.setDescrizione(descrizione);
					
					modelCategoria.doUpdate(bean);
					
					String urlPhoto = (String) request.getParameter("urlPhoto");
					if (urlPhoto != null) {
						try {
							PhotoControl.upload(nome, urlPhoto, "categoria", "nome");
						} catch (SQLException e) {
							e.printStackTrace();
						}
					}
				} else if(action.equalsIgnoreCase("insert")) {
					String nome = request.getParameter("nome");
					String descrizione = request.getParameter("descrizione");
					
					
					if(!Validator.isValidFloat(request.getParameter("prezzo"))) {
						request.setAttribute("formError","Errore prezzo");
						flag = state.INVALID_FORM;
					}
					if(!Validator.isValidFloat(request.getParameter("peso"))) {
						request.setAttribute("formError","Errore peso");
						flag = state.INVALID_FORM;
					}
					if(!Validator.isValidInt(request.getParameter("pezzi"))) {
						request.setAttribute("formError","Errore pezzi");
						flag = state.INVALID_FORM;
					}
					
					
					if(flag != state.INVALID_FORM) {
						float prezzo = Float.parseFloat(request.getParameter("prezzo"));
						float peso = Float.parseFloat(request.getParameter("peso"));
						int pezzi = Integer.parseInt(request.getParameter("pezzi"));
						
						Prodotto bean = new Prodotto();
						bean.setNome(nome);
						bean.setDescrizione(descrizione);
						bean.setPrezzo(prezzo);
						bean.setPeso(peso);
						bean.setPezzi_disponibili(pezzi);
						bean.setCategoria(request.getParameter("cat"));
						
						try {
							modelProdotto.doSave(bean);
						} catch (SQLIntegrityConstraintViolationException e) {
							request.setAttribute("formError","Esiste già un prodotto con questo nome");
							flag = state.INVALID_FORM;
						}
						
						String urlPhoto = (String) request.getParameter("urlPhoto");
						if (urlPhoto != null) {
							try {
								PhotoControl.upload(nome, urlPhoto, "prodotto", "nome");
							} catch (SQLException e) {
								e.printStackTrace();
							}
						}
						
						if (flag != state.INVALID_FORM)
							request.setAttribute("formSuccess","Prodotto inserito con successo");
					}
				} else if(action.equalsIgnoreCase("delete")) {
					String nome = request.getParameter("cat");
					modelCategoria.doDelete(nome);
					flag = state.ACTION_DELETE;
				}
			}
		}  catch(NumberFormatException e) {
			System.out.println("Error: " + e.getMessage());
			request.setAttribute("error", e.getMessage());
		}
		
		request.removeAttribute("categories");
		request.setAttribute("categories", modelCategoria.doRetrieveAll());
		
		request.removeAttribute("products");
		request.setAttribute("products", modelProdotto.doRetrieveByCategoria(cat));
			
		if(flag == state.ACTION_DELETE) {
			dispatcher = this.getServletContext().getRequestDispatcher("/adminFilter/gestioneSito.jsp");
			dispatcher.forward(request, response);
		} else {
			dispatcher = this.getServletContext().getRequestDispatcher("/adminFilter/categoria-prodotto-admin.jsp?cat="+request.getParameter("cat"));
			dispatcher.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}