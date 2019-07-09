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
<link rel="stylesheet" type="text/css" href="footer.css" />
</head>
<body>
	<div class="main">
	<jsp:include page="../header.jsp"/>
	<% 
		String nomeCat = request.getParameter("cat");
		Categoria beanCat=null;
		for(Categoria categoria: (ArrayList<Categoria>) categories){
			if(categoria.getNome().equals(nomeCat))
				beanCat = categoria;
		}
			
	%>
	
	<div id="errorMessage">
    <% if(request.getAttribute("formError")!=null){
    	%><h1 style="color: red"><%=request.getAttribute("formError")%></h1>
    <%} %>
    <% if(request.getAttribute("formSuccess")!=null){%>
	    <h1 style="color: green"><%=request.getAttribute("formSuccess")%></h1>
	<%} %>
    </div>
	
	<h1>Categoria <b><%=nomeCat %></b></h1>
	
	<h2>Modifica categoria</h2>
	<form action="ProdottoControlAdmin?cat=<%=nomeCat%>" method="post">
		<input type="hidden" name="action" value="update"> 
		<input type="hidden" name="nome" value="<%=beanCat.getNome() %>"> 
		Descrizione* <textarea name="descrizione"><%=beanCat.getDescrizione() %></textarea>
		Foto <input type="file" name="urlPhoto" accept="image/png">
		<input type="submit" value="Modifica">
	</form>

	<hr>

	<form action="ProdottoControlAdmin?cat=<%=nomeCat%>" method="post">
		<input type="hidden" name="action" value="delete"> 
		<input type="submit" value="Cancella categoria">
	</form>
	
	<hr>
	
	<h2>Inserisci prodotto di questa categoria</h2>
	<form action="ProdottoControlAdmin?cat=<%=nomeCat%>" method="post">
		<input type="hidden" name="action" value="insert"> 
		Nome* <input type="text" name="nome" value="<%if(request.getParameter("nome")!=null){%><%=request.getParameter("nome")%><%} %>" required>
		Descrizione* <textarea rows="4" cols="50" name="descrizione" placeholder="descrizione categoria" required><%if(request.getParameter("descrizione")!=null){%><%=request.getParameter("descrizione")%><%} %></textarea>
		Prezzo* <input type="text" name="prezzo" value="<%if(request.getParameter("prezzo")!=null){%><%=request.getParameter("prezzo")%><%} %>" required>
		Peso* <input type="text" name="peso" value="<%if(request.getParameter("peso")!=null){%><%=request.getParameter("peso")%><%} %>" required>
		Pezzi disponibili* <input type="text" name="pezzi" value="<%if(request.getParameter("pezzi")!=null){%><%=request.getParameter("pezzi")%><%} %>" required>
		Foto <input type="file" name="urlPhoto" accept="image/png">
		<input type="submit" value="Inserisci">
	</form>	
	
	<hr>
	
	<div class="prodottoID">
		<h2>Seleziona il prodotto da modificare</h2>
		<%
		if(products != null && products.size() > 0) {
			
			Iterator<?> it = products.iterator();
			while(it.hasNext()){
				Prodotto bean = (Prodotto)it.next();
		%>
		<div class="prodotto">
			<a href="./adminFilter/prodotto-admin.jsp?cod=<%=bean.getCodice() %>">
				<img src="./GetPicture?table=prodotto&id=<%=bean.getNome() %>">
				<h3><%=bean.getNome() %></h3>
			</a>
		</div>
	<%}} %>
	</div>
	
	<jsp:include page="../footer.jsp"/>
	</div>
</body>
</html>