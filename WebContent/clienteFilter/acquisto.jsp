<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*, ecommerce.controller.*, ecommerce.model.*"%>

<%
	Collection<?> categories = (Collection<?>)request.getAttribute("categories");
	
	Utente utente = (Utente) request.getSession().getAttribute("utente");

	if(categories == null){
		response.sendRedirect("../Acquisto");
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
			Benvenuto cliente: <%= utente.getNome() %>, <%= utente.getCognome() %>
			<h2>Compila i campi e procedi all'acquisto</h2>
			<form action="Acquisto" method="post">
				<input type="hidden" name="action" value="buy"> 
				<input type="hidden" name="dataOrdine" value="<%= new Date()%>"> 
				<input type="hidden" name="stato" value="1"> 
				Nome: <input type="text" value="<%=utente.getNome() %>"><br>
				Cognome: <input type="text" value="<%=utente.getCognome() %>"><br>
				Numero di telefono: <input type="text" placeholder="333-3333333"><br>
				Indirizzo spedizione: <input type="text" name="indirizzo" placeholder="via Verdi, 30, Roma 83541"><br>
				<input type="submit" value="Acquista">
			</form>
			
			<jsp:include page="../footer.jsp"/>
	</div>
	
</body>
</html>