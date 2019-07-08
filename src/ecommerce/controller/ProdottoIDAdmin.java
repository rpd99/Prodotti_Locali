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
import ecommerce.utils.Validator;

@WebServlet("/ProdottoIDAdmin")
public class ProdottoIDAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	static CategoriaDAO modelCategoria = new CategoriaDAO();
	static ProdottoDAO modelProdotto = new ProdottoDAO();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		int flag=0;
		
		try {
			if(action != null) {
				if(action.equalsIgnoreCase("update")) {
					String nome = request.getParameter("nome");
					String descrizione = request.getParameter("descrizione");
					
					if(!Validator.isValidFloat(request.getParameter("prezzo"))) {
						request.setAttribute("formError","errore prezzo");
						flag=2;
					}
					if(!Validator.isValidFloat(request.getParameter("peso"))) {
						request.setAttribute("formError","errore peso");
						flag=2;
					}
					if(!Validator.isValidInt(request.getParameter("pezzi"))) {
						request.setAttribute("formError","errore pezzi");
						flag=2;
					}
					
					float prezzo = Float.parseFloat(request.getParameter("prezzo"));
					float peso = Float.parseFloat(request.getParameter("peso"));
					int pezzi = Integer.parseInt(request.getParameter("pezzi"));
					String categoria = request.getParameter("categoria");
					
					Prodotto bean = new Prodotto();
					bean.setCodice(Integer.parseInt(request.getParameter("cod")));
					bean.setNome(nome);
					bean.setDescrizione(descrizione);
					bean.setPrezzo(prezzo);
					bean.setPeso(peso);
					bean.setPezzi_disponibili(pezzi);
					bean.setCategoria(categoria);
					
					modelProdotto.doUpdate(bean);
					
					String urlPhoto = (String) request.getParameter("urlPhoto");
					if (urlPhoto != null) {
						try {
							PhotoControl.upload(nome, urlPhoto, "prodotto", "nome");
						} catch (SQLException e) {
							e.printStackTrace();
						}
					}
				} else if(action.equalsIgnoreCase("delete")) {
					int cod = Integer.parseInt(request.getParameter("cod"));
					modelProdotto.doDelete(cod);
					flag=1;
				}
			}
		}  catch(NumberFormatException e) {
			System.out.println("Error: " + e.getMessage());
			request.setAttribute("error", e.getMessage());
		}
		
		
		request.removeAttribute("categories");
		request.setAttribute("categories", modelCategoria.doRetrieveAll());
		
		
		request.removeAttribute("products");
		int cod = Integer.parseInt(request.getParameter("cod"));
		request.setAttribute("products", modelProdotto.doRetrieveByID(cod));

		RequestDispatcher dispatcher;
		
		if(flag==0) {
			dispatcher = this.getServletContext().getRequestDispatcher("/adminFilter/prodotto-admin.jsp");
			dispatcher.forward(request, response);
		} else if (flag==1){
			dispatcher = this.getServletContext().getRequestDispatcher("/adminFilter/gestioneSito.jsp");
			dispatcher.forward(request, response);
		} else {
			dispatcher = request.getRequestDispatcher("/adminFilter/prodotto-admin.jsp");
			dispatcher.forward(request, response);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
