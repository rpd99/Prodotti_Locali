<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*, ecommerce.controller.*, ecommerce.model.*"%>    
    
    
<%
	Collection<?> categories = (Collection<?>)request.getAttribute("categories");

	if(categories == null){
		response.sendRedirect("./CategoriaControlChiSiamo");
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
		<jsp:include page="header.jsp"/>
		<div class="chiSiamo">
			<h4>
				L'obiettivo è quello di offrire al consumatore finale dei prodotti sani, di alta qualita', necessari e fondamentali per il benessere del nostro organismo.
				Molteplici sono i prodotti acquistabili nel nostro sito, ciascuno dei quali è selezionato da uno studio approfondito per garantire al cliente il miglior prodotto, che sia italiano, locale ed estero.
				<hr>Tra di essi:
			</h4>
			<%
				if(categories != null && categories.size() > 0) {
					Iterator<?> it = categories.iterator();
					while(it.hasNext()){
						Categoria bean = (Categoria)it.next();
			%>
						<h4><b><a href="categoria-prodotto.jsp?cat=<%=bean.getNome() %>"><%=bean.getNome() %>: </a></b><%=bean.getDescrizione() %></h4>
			<%}} %>
		</div>	
		<jsp:include page="footer.jsp"/>
	</div>
	
</body>
</html>