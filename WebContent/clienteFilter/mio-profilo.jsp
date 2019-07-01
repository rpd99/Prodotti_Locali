<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*, ecommerce.controller.*, ecommerce.model.*"%>

<%
	Collection<?> categories = (Collection<?>)request.getAttribute("categories");
	Collection<?> ordini = (Collection<?>)request.getAttribute("ordini");
	Utente utente = (Utente) request.getSession().getAttribute("utente");

	if(categories == null){
		response.sendRedirect("../MioProfilo");
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
			Benvenuto cliente: <%= utente.getNome() %>, <%= utente.getCognome() %><br>
			 
			<% if(ordini.size() > 0) {%>
				i tuoi ordini sono:
				
			<%	Iterator<?> it = ordini.iterator();
				while(it.hasNext()){
					OrdineProdotto bean = (OrdineProdotto)it.next();
			%>
				Data spedizione <%=bean.getOrdine().getData_spedizione() %>
				Data ordine <%=bean.getOrdine().getDataOrdine() %>
				Prezzo <%=bean.getOrdine().getPrezzo() %>
				Indirizzo <%=bean.getOrdine().getInd_sped() %>
				<br>
				
			<% }}%>
			<jsp:include page="../footer.jsp"/>
	</div>
	
</body>
</html>