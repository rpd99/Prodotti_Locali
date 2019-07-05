<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*, ecommerce.controller.*, ecommerce.model.*"%>

<%
	Collection<?> categories = (Collection<?>)request.getAttribute("categories");
	Collection<?> ordini = (Collection<?>)request.getAttribute("ordiniProdotti");
	Utente utente = (Utente) request.getSession().getAttribute("utente");

	if(categories == null || ordini == null){
		response.sendRedirect("../InfoOrdineProdotto?cod="+request.getParameter("cod"));
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
			<h2>Benvenuto cliente: <b><%= utente.getNome() %>, <%= utente.getCognome() %></b></h2>
			 
			<% if(ordini.size() > 0) {%>
				<h4>I prodotti dell'ordine selezionato:</h4>
				<table>
					<tr>
						<th>Nome</th> 
						<th>Prezzo</th>
						<th>Quantita'</th>
					</tr>
				
			<%	Iterator<?> it = ordini.iterator();
				while(it.hasNext()){
					OrdineProdotto bean = (OrdineProdotto)it.next();
			%>
					<tr>
						<td><%=bean.getProdotto().getNome() %></td>
						<td><%=bean.getProdotto().getPrezzo() * bean.getQuantita()%>&euro;</td>
						<td><%=bean.getQuantita() %></td>
					</tr>
				
			<% } %>  </table>  <%}%>
			
			<jsp:include page="../footer.jsp"/>
	</div>
	
</body>
</html>