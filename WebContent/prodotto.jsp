<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*, ecommerce.controller.*, ecommerce.model.*"%>

<% 
	Collection<?> categories = (Collection<?>)request.getAttribute("categories");	
	Prodotto product = (Prodotto)request.getAttribute("products");
	
	if(product == null || categories == null){
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
<link rel="stylesheet" type="text/css" href="styleheader.css" />
</head>
<body>
	<jsp:include page="header.jsp"/>
	
	<div class="prodottiID">
		<h2>Prodotto</h2>
		<img src="./GetPicture?table=prodotto&id=<%=product.getNome() %>" width="350" height="100">
		<%=product.getCodice() %>
		<%=product.getNome() %>
		<%=product.getDescrizione() %>
		<%=product.getPeso() %>
		<%=product.getPezzi_disponibili() %>
		<%=product.getPrezzo() %>
	</div>
	
</body>
</html>