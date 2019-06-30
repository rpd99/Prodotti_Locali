<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*, ecommerce.controller.*, ecommerce.model.*"%>

<%
	Collection<?> categories = (Collection<?>)request.getAttribute("categories");

	if(categories == null){
		response.sendRedirect("./CategoriaControl");
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
</head>
<body>
	
	<div class="main">
		<jsp:include page="header.jsp"/>
		<div class="image"><img src="a.png" alt="no image"></div>
		<div class="text">Vi offriamo Prodotti sani, necessari e fondamentali per il benessere del nostro organismo</div>
		
		<h2>Categorie</h2>
		<%
			if(categories != null && categories.size() > 0) {
				
				Iterator<?> it = categories.iterator();
				while(it.hasNext()){
					Categoria bean = (Categoria)it.next();
		%>
					<div class="categories">
						<a href="categoria-prodotto.jsp?cat=<%=bean.getNome() %>"><img src="./GetPicture?table=categoria&id=<%=bean.getNome() %>" alt="<%=bean.getNome() %>"></a>
					</div>
		<%}} %>
		<jsp:include page="footer.jsp"/>
	</div>
	
</body>
</html>