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
		<img src="./GetPicture?table=prodotto&id=<%=product.getNome() %>">
		<%=product.getCodice() %>
		<%=product.getNome() %>
		<%=product.getDescrizione() %>
		<%=product.getPeso() %>
		<%=product.getPezzi_disponibili() %>
		<%=product.getPrezzo() %>
		
		<form action="CarrelloControl">
			<input type="hidden" name="action" value="addCart">
			<input type="hidden" name="id" value="<%=product.getCodice()%>">
			<input type="number" name="quantita" value="1" min="1" max="<%=product.getPezzi_disponibili() %>">
			<input type="submit" value="aggiungi al carrello">
		</form>
	</div>
	
</body>
</html>