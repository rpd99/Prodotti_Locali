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
<title>Prodotto </title>
<link rel="stylesheet" type="text/css" href="layout.css" />
<link rel="stylesheet" type="text/css" href="styleheader.css" />
<link rel="stylesheet" type="text/css" href="footer.css" />
</head>
<body>
	
	<div class="main">
		<jsp:include page="../header.jsp"/>
		<div id="errorMessage">
    	<% if(request.getAttribute("formError")!=null){
    		%><h1 style="color: red"><%=request.getAttribute("formError")%></h1>
    	<%} %>
    	<% if(request.getAttribute("formSuccess")!=null){%>
		    <h1 style="color: green"><%=request.getAttribute("formSuccess")%></h1>
		<%} %>
    	</div>
    	
		<h2>Prodotto <b><%=product.getNome() %></b></h2>
		<div class="prodottoIDAdmin">
			<img src="./GetPicture?table=prodotto&id=<%=product.getNome() %>">
		</div>
				
		<h1>Modifica prodotto</h1>
		<form action="ProdottoIDAdmin?cod=<%=request.getParameter("cod") %>" method="post">
			<input type="hidden" name="action" value="update"> 
			<input type="hidden" name="categoria" value="<%=product.getCategoria() %>"> 
			<input type="hidden" name="nome" value="<%=product.getNome() %>">
			Descrizione* <textarea name="descrizione"><%=product.getDescrizione() %></textarea>
			Prezzo* <input type="text" name="prezzo" value="<%=product.getPrezzo() %>">
			Peso* <input type="text" name="peso" value="<%=product.getPeso() %>">
			Pezzi disponibili* <input type="text" name="pezzi" value="<%=product.getPezzi_disponibili() %>">
			Foto <input type="file" name="urlPhoto" accept="image/png">
			<input type="submit" value="Modifica">
		</form>
		
		<hr>
		
		<form action="ProdottoIDAdmin?cod=<%=request.getParameter("cod") %>" method="post">
			<input type="hidden" name="action" value="delete"> 
			<input type="submit" value="Cancella prodotto">
		</form>
		
		<jsp:include page="../footer.jsp"/>
	</div>
	
</body>
</html>