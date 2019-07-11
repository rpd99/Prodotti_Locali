<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*, ecommerce.controller.*, ecommerce.model.*"%>

<% 
	Collection<?> categories = (Collection<?>)request.getAttribute("categories");	
	Collection<?> products = (Collection<?>)request.getAttribute("products");
	String description = (String)request.getAttribute("description");
	
	if(products == null || categories == null){
		response.sendRedirect("./ProdottoControl?cat="+request.getParameter("cat"));
		return;
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Categorie</title>
<link rel="stylesheet" type="text/css" href="layout.css" />
<link rel="stylesheet" type="text/css" href="styleheader.css" />
<link rel="stylesheet" type="text/css" href="footer.css" />
</head>
<body>
	<div class="main">
	<jsp:include page="header.jsp"/>
	
		<!--  
		<div class="left">	
			Categorie<br>
		<%
			if(categories != null && categories.size() > 0) {
				
				Iterator<?> it = categories.iterator();
				while(it.hasNext()){
					Categoria bean = (Categoria)it.next();
		%>
			<a href="categoria-prodotto.jsp?cat=<%=bean.getNome() %>"><%=bean.getNome() %></a><br>
		<%}} %>
		</div>
		-->
		<h2>Prodotti della categoria <b><%=request.getParameter("cat") %></b></h2>
		<h4><%=if(description != null) {
				description
		}%></h4>
		<div class="prodottoID">
		<%
			if(products != null && products.size() > 0) {
				
				Iterator<?> it = products.iterator();
				while(it.hasNext()){
					Prodotto bean = (Prodotto)it.next();
		%>
			<div class="prodotto">
				<a href="prodotto.jsp?cod=<%=bean.getCodice() %>">
					<img src="./GetPicture?table=prodotto&id=<%=bean.getNome() %>">
					<h3><%=bean.getNome() %>, <%=bean.getPrezzo() %>&euro;</h3>
				</a>
			</div>
		<%}} %>
		</div>
		
	<jsp:include page="footer.jsp"/>
	</div>
</body>
</html>