<%@page import="java.time.LocalDateTime"%>
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
			
			<div id="errorMessage">
	    	<% if(request.getAttribute("formError")!=null){%>
	    		<h1 style="color: red"><%=request.getAttribute("formError")%></h1>
	    	<%} %>
	    	<% if(request.getAttribute("formSuccess")!=null){%>
	    		<h1 style="color: green"><%=request.getAttribute("formSuccess")%></h1>
	    	<%} %>
	    	</div>
			
			Benvenuto cliente: <%= utente.getNome() %>, <%= utente.getCognome() %>
			<h2>Compila i campi e procedi all'acquisto</h2>
			<form action="Acquisto" method="post">
				<input type="hidden" name="action" value="buy"> 
				Nome*: <input type="text" value="<%if(request.getParameter("nome")!=null){%><%=request.getParameter("nome")%><%} %>" name="nome" required><br>
				Cognome*: <input type="text" value="<%if(request.getParameter("cognome")!=null){%><%=request.getParameter("cognome")%><%} %>" name="cognome" required><br>
				Numero di telefono*: <input type="text" placeholder="333-3333333" value="<%if(request.getParameter("numero")!=null){%><%=request.getParameter("numero")%><%} %>" name="numero" required><br>
				Indirizzo spedizione*: <input type="text" value="<%if(request.getParameter("indirizzo")!=null){%><%=request.getParameter("indirizzo")%><%} %>" placeholder="via Verdi, 30, Roma 83541" name="indirizzo" required><br>
				<input type="submit" value="Acquista">
			</form>
			
			<jsp:include page="../footer.jsp"/>
	</div>
	
</body>
</html>