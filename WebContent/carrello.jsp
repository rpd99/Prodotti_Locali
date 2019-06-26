<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*, java.lang.*, ecommerce.controller.*, ecommerce.model.*"%>

<%
	Collection<?> categories = (Collection<?>)request.getAttribute("categories");	
	Collection<?> products = (Collection<?>)request.getAttribute("products");
	Carrello cart = (Carrello)request.getAttribute("carrello");
	
	if(cart == null || categories == null || products == null){
		response.sendRedirect("./CarrelloControl");
		return;
	}
	
%> 
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Carrello</title>
<link rel="stylesheet" type="text/css" href="layout.css" />
<link rel="stylesheet" type="text/css" href="styleheader.css" />
</head>
<body>
	
	<div class="main">
		<jsp:include page="header.jsp"/>
			<table>
				<tr>
					<td>Prodotto</td>
					<td>Prezzo</td>
					<td>Quantita</td>
					<td>#</td>
				</tr>
				<tr>
					<%
						if(cart.getSize() > 0){
							for(ProdottoQuantita prod: (cart.getProdotti())){
					%>
						<tr>
							<td><%for(Prodotto prodotto: ((ArrayList<Prodotto>)products)){
								if(prodotto.getCodice() == prod.getProdotto()){
								%>
								<%=prodotto.getNome() %>
							</td>
							<td><%=prodotto.getPrezzo() %></td>
							<td><input type="number" min=0 max=999 name="quantita" value=<%=prod.getQuantita() %>></td>
							<td>
								<a href="CarrelloControl?action=updateCart&id=<%=prod.getProdotto() %>">Aggiorna</a>
								<!-- <button onclick="doSearch()">Search</button>
<script>
 function doSearch() {
  let word = document.querySelector('#inputWord').value;
  window.location = "https://www.google.com.uy/search?q=" + word;
 }
</script> -->
							</td>
							<%}}%>
						</tr>
					<%
							}
						} else {
					%>
						<tr>
							<td colspan="2">No products avaible</td>
						</tr>
						
					<%	} %>
				</tr>
			</table>
		<jsp:include page="footer.jsp"/>
	</div>
	
</body>
</html>