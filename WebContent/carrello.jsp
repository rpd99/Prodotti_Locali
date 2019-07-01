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
			<h1>Il tuo carrello</h1>
			<% if(cart.getSize() > 0){ %>
				<table>
					<tr>
						<td>Prodotto</td>
						<td>Prezzo</td>
						<td>Quantita</td>
						
					</tr>
						<%
							float tot=0;
							for(ProdottoQuantita prod: (cart.getProdotti())){
								tot += prod.getQuantita() * prod.getProdotto().getPrezzo();
						%>
							<tr>
								<td>
									<%=prod.getProdotto().getNome() %>
								</td>
								<td><%=prod.getQuantita() * prod.getProdotto().getPrezzo()%></td>
				 				<td>
				 					<form action="CarrelloControl" method="post">
				 						<input type="number" min=0 max=<%=prod.getProdotto().getPezzi_disponibili() %> name="quantita" value=<%=prod.getQuantita()%>>
				 				
										<input type="hidden" name="action" value="updateCart">
										<input type="hidden" name="id" value="<%=prod.getProdotto().getCodice()%>">
										<input type="submit" value="aggiorna">
									</form>
									
									<form action="CarrelloControl" method="post">
										<input type="hidden" name="action" value="deleteCart">
										<input type="hidden" name="id" value="<%=prod.getProdotto().getCodice()%>">
										<input type="submit" value="elimina">
									</form>
								</td>
								<%}%>
							</tr>
				</table>
				<a href="CarrelloControl?action=deleteAllCart">Svuota carrello!</a>
				<h6>Totale: <%=tot %></h6>
				<a href="./clienteFilter/acquisto.jsp">Acquista</a>
			<%} else {
			%>
				<span>Il carrello è vuoto</span>
			<%	} %>
		<jsp:include page="footer.jsp"/>
	</div>
	
</body>
</html>