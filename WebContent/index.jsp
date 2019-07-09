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
<link rel="stylesheet" type="text/css" href="layout.css?ts=<?=time()?>&quot" />
<link rel="stylesheet" type="text/css" href="styleheader.css?ts=<?=time()?>&quot" />
<link rel="stylesheet" type="text/css" href="footer.css?ts=<?=time()?>&quot" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script>
$(document).ready(function(){
  $(".image").hover(function(){
    $(".image").animate({opacity:"1"}, "slow");
    }, function(){
    $(".image").animate({opacity:"0.9"}, "slow");
  });
});
</script>
</head>
<body>
	
	<div class="main">
		<jsp:include page="header.jsp"/>
		<div class="image">
			<img src="./GetPicture?table=images&id=benessere" alt="no image">
		</div>
		<h1>Vi offriamo prodotti sani, necessari e fondamentali per il benessere del nostro organismo</h1>
		
		<hr>
		
		<h2>Scegli una delle nostre categorie </h2>
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