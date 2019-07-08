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
				
			<div id="errorMessage">
	    	<% if(request.getAttribute("formError")!=null){
	    		%><h1 style="color: red"><%=request.getAttribute("formError")%></h1>
	    	<%} %>
	    	</div>
    	
			<h2>Benvenuto cliente: <b><%= utente.getNome() %>, <%= utente.getCognome() %></b></h2>
			<a href="Logout">Logout</a>
			<% if(ordini.size() > 0) {%>
				<h4>I tuoi ordini sono:</h4>
				<table>
					<tr>
						<th>Data spedizione</th> 
						<th>Data ordine </th>
						<th>Prezzo</th> 
						<th>Indirizzo</th>
						<th></th> 
					</tr>
				
			<%	Iterator<?> it = ordini.iterator();
				while(it.hasNext()){
					Ordine bean = (Ordine)it.next();
			%>
					<tr>
						<td><%=bean.getData_spedizione() %></td>
						<td><%=bean.getDataOrdine() %></td>
						<td><%=bean.getPrezzo() %>&euro;</td>
						<td><%=bean.getInd_sped() %></td>
						<td><a href="./clienteFilter/infoProdotto.jsp?cod=<%=bean.getCodice() %>">Dettagli</a></td>
					</tr>
				
			<% } %>  </table>  <%}%>
			
			<h2>Modifica password:</h2>
			<form action="MioProfilo" method="post">
				<input type="hidden" name="action" value="update">
				Vecchia password*: <input type="password" name="vecchiaPassword" required>
				Nuova password*: <input type="password" name="nuovaPassword1" required>
				Conferma password*: <input type="password" name="nuovaPassword2" required>
				<input type="submit" value="Modifica">
			</form>
			
			
			<jsp:include page="../footer.jsp"/>
	</div>
	
</body>
</html>