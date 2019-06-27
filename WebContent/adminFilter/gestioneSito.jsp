<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*, ecommerce.controller.*, ecommerce.model.*"%>

<%
	Collection<?> categories = (Collection<?>)request.getAttribute("categories");
	
	Utente utente = (Utente) request.getSession().getAttribute("utente");

	if(categories == null){
		response.sendRedirect("../CategoriaControlAdmin");
		return;
	}
	
%> 
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Prodotti locali</title>
<link rel="stylesheet" type="text/css" href="layout.css" />
<link rel="stylesheet" type="text/css" href="styleheader.css" />
</head>
<body>
	
	<div class="main">
			benvenuto admin: <%= utente.getNome() %>, <%= utente.getCognome() %>
			<h2>Scegli una categoria da modificare</h2>
			<%
				if(categories != null && categories.size() > 0) {
					
					Iterator<?> it = categories.iterator();
					while(it.hasNext()){
						Categoria bean = (Categoria)it.next();
			%>
						<div class="categories">
							<a href="./adminFilter/categoria-prodotto-admin.jsp?cat=<%=bean.getNome() %>"><img src="./GetPicture?table=categoria&id=<%=bean.getNome() %>"></a>
						</div>
			<%}} %>
	</div>
	
</body>
</html>