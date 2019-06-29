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
import ecommerce.model.Prodotto;
import ecommerce.model.ProdottoDAO;
import ecommerce.utils.PhotoControl;


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
					
					modelProdotto.doSave(bean);
					
					String urlPhoto = (String) request.getParameter("urlPhoto");
					if (urlPhoto != null) {
						try {
							PhotoControl.upload(nome, urlPhoto, "prodotto", "nome");
						} catch (SQLException e) {
							e.printStackTrace();
						}
					}
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
