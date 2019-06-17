<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*, ecommerce.controller.*, ecommerce.model.*"%>

<%
	Collection<?> products = (Collection<?>)request.getAttribute("products");

	if(products == null){
		response.sendRedirect("./CategoriaControl");
		return;
	}
	
%>   
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="layout.css" />
</head>
<body>
	<div class="image"><img src="a.png" alt="no image"></div>
	<div class="text">Vi offriamo Prodotti sani, necessari e fondamentali per il benessere del nostro organismo</div>
	
	
	
	
	<h2>Categorie</h2>
	<%
		if(products != null && products.size() > 0) {
			
			Iterator<?> it = products.iterator();
			while(it.hasNext()){
				Categoria bean = (Categoria)it.next();
	%>
		<div class="categories">
		<a href=""><img src="./GetPicture?table=categoria&id=<%=bean.getNome() %>"></a>
		</div>
	<%}} %>
	
</body>
</html>