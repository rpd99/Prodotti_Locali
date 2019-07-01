<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*, java.lang.*, ecommerce.controller.*, ecommerce.model.*"%>

<%
	Collection<?> categories = (Collection<?>)request.getAttribute("categories");	
	Collection<?> products = (Collection<?>)request.getAttribute("products");
	Carrello cart = (Carrello)request.getAttribute("cart");
	
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
<link rel="stylesheet" type="text/css" href="footer.css" />
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
							<td><%=prod.getQuantita() * prodotto.getPrezzo()%></td>
			 				<td>
			 					<form action="CarrelloControl" method="post">
			 						<input type="number" min=0 max=10 name="quantita" value=<%=prod.getQuantita()%>>
			 				
									<input type="hidden" name="action" value="updateCart">
									<input type="hidden" name="id" value="<%=prodotto.getCodice()%>">
									<input type="submit" value="aggiorna">
								</form>
							</td>
							<%}}%>
						</tr>
					<%
							}
						} else {
					%>
						<tr>
							<td colspan="2">No products available</td>
						</tr>
						
					<%	} %>
			</table>
		<jsp:include page="footer.jsp"/>
	</div>
	
</body>
</html>