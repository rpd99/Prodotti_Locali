package ecommerce.utils;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LoginFilter")
public class LoginFilter extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		{
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String redirectedPage;
			try {
				checkLogin(username, password);
				request.getSession().setAttribute("adminFilterRoles", true);
				redirectedPage = "/index.jsp";
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(redirectedPage);
				dispatcher.forward(request, response);
			} catch (Exception e) {
				request.getSession().removeAttribute("adminFilterRoles");
				redirectedPage = "/login-form-filter.jsp";
				response.sendRedirect(request.getContextPath() + redirectedPage);
			}
			
		}
	}

	private void checkLogin(String username, String password) throws Exception {
		if ("root@ingl.com".equals(username) && "adminA123".equals(password)) {
			//
		} else
			throw new Exception("Invalid login and password");
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
