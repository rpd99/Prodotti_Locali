<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*, ecommerce.controller.*, ecommerce.model.*"%>

<% 
	Collection<?> categories = (Collection<?>)request.getAttribute("categories");	
	Collection<?> products = (Collection<?>)request.getAttribute("products");
	
	if(products == null || categories == null){
		response.sendRedirect("../ProdottoControlAdmin?cat="+request.getParameter("cat"));
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
</head>
<body>
	
	<jsp:include page="../header.jsp"/>
	<% 
		String nomeCat = request.getParameter("cat");
		Categoria beanCat=null;
		for(Categoria categoria: (ArrayList<Categoria>) categories){
			if(categoria.getNome().equals(nomeCat))
				beanCat = categoria;
		}
			
	%>
	<h1>modifica categoria</h1>(ai campi obbligatori mettiamo *)<br>
	<form action="ProdottoControlAdmin?cat=<%=nomeCat%>" method="post">
		<input type="hidden" name="action" value="update"> 
		<input type="hidden" name="nome" value="<%=beanCat.getNome() %>"> 
		Descrizione: <input type="text" name="descrizione" value="<%=beanCat.getDescrizione() %>">
		Foto: <input type="file" name="urlPhoto" accept="image/png">
		<input type="submit">
	</form>
	<!--  Per modificarne l'immagine clicca <a href="adminFilter/photo-upload.html">qui</a><br> -->
	
	
	<h1>Inserisci prodotto di questa categoria: <%=nomeCat %></h1>
	<form action="ProdottoControlAdmin?cat=<%=nomeCat%>" method="post">
		<input type="hidden" name="action" value="insert"> 
		Nome: <input type="text" name="nome">
		Descrizione: <input type="text" name="descrizione">
		Prezzo: <input type="text" name="prezzo">
		Peso: <input type="text" name="peso">
		Pezzi disponibili: <input type="text" name="pezzi">
		Foto: <input type="file" name="urlPhoto" accept="image/png">
		<input type="submit">
	</form>
	<!-- Per inserire l'immagine clicca <a href="adminFilter/photo-upload.html">qui</a><br> -->
	
	
	
	
	<div class="prodottoID">
		<h2>Seleziona il prodotto da modificare</h2>
	<%
		if(products != null && products.size() > 0) {
			
			Iterator<?> it = products.iterator();
			while(it.hasNext()){
				Prodotto bean = (Prodotto)it.next();
	%>
		<div class="prodotto">
		<a href="./adminFilter/prodotto-admin.jsp?cod=<%=bean.getCodice() %>"><img src="./GetPicture?table=prodotto&id=<%=bean.getNome() %>" width="350" height="100"></a>
		</div>
	<%}} %>
	</div>
	
	<jsp:include page="../footer.jsp"/>
	
</body>
</html>