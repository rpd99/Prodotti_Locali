<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*, ecommerce.controller.*, ecommerce.model.*"%>

<% 
	Collection<?> categories = (Collection<?>)request.getAttribute("categories");	
	Prodotto product = (Prodotto)request.getAttribute("products");
	
	if(product == null || categories == null){
		response.sendRedirect("../ProdottoIDAdmin?cod="+request.getParameter("cod"));
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
	
	<div class="prodottiID">
		<jsp:include page="../header.jsp"/>
		<h2>Prodotto: <%=product.getNome() %></h2>
		<img src="./GetPicture?table=prodotto&id=<%=product.getNome() %>" width="350" height="100">
		
		
		<form action="ProdottoIDAdmin?cod=<%=request.getParameter("cod") %>" method="post">
			<input type="hidden" name="action" value="update"> 
			<input type="hidden" name="categoria" value="<%=product.getCategoria() %>"> 
			<input type="hidden" name="nome" value="<%=product.getNome() %>">
			Descrizione: <input type="text" name="descrizione" value="<%=product.getDescrizione() %>">
			Prezzo: <input type="text" name="prezzo" value="<%=product.getPrezzo() %>">
			Peso: <input type="text" name="peso" value="<%=product.getPeso() %>">
			Pezzi disponibili: <input type="text" name="pezzi" value="<%=product.getPezzi_disponibili() %>">
			Foto: <input type="file" name="urlPhoto" accept="image/png">
			<input type="submit">
		</form>
		<!--  Per modificare l'immagine clicca <a href="adminFilter/photo-upload.html">qui</a><br>  -->
		<jsp:include page="../footer.jsp"/>
	</div>
	
</body>
</html>