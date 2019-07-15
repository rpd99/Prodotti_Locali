package ecommerce.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ecommerce.model.Utente;
import ecommerce.utils.*;

//@WebServlet("/PutPicture")
public class PutPicture extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Utente u = (Utente) request.getSession().getAttribute("utente");
		if(u==null || u.getIs_Admin() != 1) {
			response.sendRedirect("./login.jsp");
			return;
		}
		
		String id = (String) request.getParameter("id");
		String table = (String) request.getParameter("table");
		String urlPhoto = (String) request.getParameter("urlPhoto");
		String column = (String) request.getParameter("column");
		if (id != null && table != null && urlPhoto != null && column != null) {
			try {
				PhotoControl.upload(id, urlPhoto, table, column);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}