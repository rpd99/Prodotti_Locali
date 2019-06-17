<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*, ecommerce.controller.*, ecommerce.model.*"%>

<% 
	Collection<?> categories = (Collection<?>)request.getAttribute("categories");	
	Prodotto products = (Prodotto)request.getAttribute("products");
	
	if(products == null || categories == null){
		response.sendRedirect("./ProdottoID?cod="+request.getParameter("cod"));
		return;
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Prodotto</title>
<link rel="stylesheet" type="text/css" href="layout.css" />
</head>
<body>
	<jsp:include page="header.jsp"/>
	
	<div class="prodottiID">
		<h2>Prodotto</h2>
		<%=products.getCodice() %>
		<%=products.getNome() %>
	</div>
	
</body>
</html>