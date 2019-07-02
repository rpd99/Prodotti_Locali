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
<link rel="stylesheet" type="text/css" href="footer.css" />
</head>
<body>
	<div class="main">
		<jsp:include page="header.jsp"/>
		
		<div class="prodottoDettaglio">
			<h2>Prodotto <b><%=product.getNome() %></b></h2>
			<img src="./GetPicture?table=prodotto&id=<%=product.getNome() %>">
			<h2>Informazioni sul prodotto: </h2>
			<ul>
				<h4><li><i>Descrizione: </i><%=product.getDescrizione() %></h4></li>
				<h4><li><i>Peso: </i><%=product.getPeso() %>Kg.</li></h4>
				<h4><li><i>Pezzi disponibili: </i><%=product.getPezzi_disponibili() %></li></h4>
				<h4><li><i>Prezzo: </i><%=product.getPrezzo() %>&euro;</li></h4>
			</ul>
			
			
			<form action="CarrelloControl">
				<input type="hidden" name="action" value="addCart">
				<input type="hidden" name="id" value="<%=product.getCodice()%>">
				<input type="number" name="quantita" value="1" min="1" max="<%=product.getPezzi_disponibili() %>">
				<input type="submit" value="Aggiungi al carrello">
			</form>
		</div>
		
		<jsp:include page="footer.jsp"/>
	</div>
</body>
</html>