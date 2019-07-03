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
<link rel="stylesheet" type="text/css" href="footer.css" />
</head>
<body>
	<div class="main">
			<jsp:include page="../header.jsp"/>
			<h1>Benvenuto admin: <b><%= utente.getNome() %>, <%= utente.getCognome() %></b></h1>
			<h2>Inserisci una nuova categoria:</h2>
			<form action="CategoriaControlAdmin" method="post">
				<input type="hidden" name="action" value="insert"> 
				Nome*: <input type="text" name="nome" placeholder="nome"> 
				Descrizione*: <textarea rows="4" cols="50" name="descrizione" placeholder="descrizione categoria"></textarea>
				Foto: <input type="file" name="urlPhoto" accept="image/png">
				<input type="submit" value="Aggiungi">
			</form>
			<!-- Per aggiungerne l'immagine clicca <a href="adminFilter/photo-upload.html">qui</a><br> -->
			
			
			<h2>Scegli una categoria da modificare:</h2>
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
			<jsp:include page="../footer.jsp"/>
	</div>
	
</body>
</html>