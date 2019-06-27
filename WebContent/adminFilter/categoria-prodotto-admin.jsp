<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*, ecommerce.controller.*, ecommerce.model.*"%>

<% 
	Collection<?> categories = (Collection<?>)request.getAttribute("categories");	
	Collection<?> products = (Collection<?>)request.getAttribute("products");
	
	if(products == null || categories == null){
		response.sendRedirect("../ProdottoControlAdmin?cat="+request.getParameter("cat"));
		return;
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Categorie</title>
<link rel="stylesheet" type="text/css" href="layout.css" />
<link rel="stylesheet" type="text/css" href="styleheader.css" />
</head>
<body>
		qua va il form per modificare il prodotto<br>
	<div class="prodottoID">
		<h2>Seleziona il prodotto da modificare</h2>
	<%
		if(products != null && products.size() > 0) {
			
			Iterator<?> it = products.iterator();
			while(it.hasNext()){
				Prodotto bean = (Prodotto)it.next();
	%>
		<div class="prodotto">
		<a href="prodotto.jsp?cod=<%=bean.getCodice() %>"><img src="./GetPicture?table=prodotto&codice=<%=bean.getCodice() %>" width="350" height="100"></a>
		</div>
	<%}} %>
	</div>
	
</body>
</html>