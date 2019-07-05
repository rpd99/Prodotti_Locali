package ecommerce.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import ecommerce.model.Carrello;
import ecommerce.model.CategoriaDAO;
import ecommerce.model.Ordine;
import ecommerce.model.OrdineDAO;
import ecommerce.model.OrdineProdotto;
import ecommerce.model.OrdineProdottoDAO;
import ecommerce.model.Prodotto;
import ecommerce.model.ProdottoDAO;
import ecommerce.model.ProdottoQuantita;
import ecommerce.model.Utente;


@WebServlet("/RicercaAjax")
public class RicercaAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;

	static ProdottoDAO modelProdotto = new ProdottoDAO();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String search = request.getParameter("keyword");
		JSONArray prodJson = new JSONArray();
		
		if(search != null) {
			List<Prodotto> prodotti = modelProdotto.doRetrieveByNomeLike(search);
			
			for(Prodotto p : prodotti) {
				prodJson.put(p.getNome());
				prodJson.put(p.getCodice());
			}
		}
		
		response.setContentType("application/json");
		response.getWriter().append(prodJson.toString());		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
