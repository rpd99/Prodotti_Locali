package ecommerce.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/GetPicture")
public class GetPicture extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = (String) request.getParameter("id");
		if (id != null) {
			byte[] bt = PhotoControl.load(id);
			
			ServletOutputStream out = response.getOutputStream();
			if(bt != null ) {
				out.write(bt);
				response.setContentType("image /png");
			}
			out.close();
		}
	}
}
