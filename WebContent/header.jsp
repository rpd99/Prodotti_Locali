<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*, ecommerce.controller.*, ecommerce.model.*"%>

<% Collection<?> categories = (Collection<?>)request.getAttribute("categories"); %>

<a href=""><img src="facebook"></a>
<a href=""><img src="facebook"></a>

<hr>

<a href=""><img src="logo"></a>

<nav>
	<ul id="main">
		<li><a href="./index.jsp">Home</a></li>
		<li class="dropdown">
			<a href="categoria-prodotto.jsp?cat=tutte">Tutti i nostri prodotti</a>
			<ul>
			<%
				if(categories != null && categories.size() > 0) {
					
					Iterator<?> it = categories.iterator();
					while(it.hasNext()){
						Categoria bean = (Categoria)it.next();
				%>
				<a href=""><li><%=bean.getNome()%></li></a>
				<%}} %>
			</ul>
		</li>
		<li>Chi siamo?</li>
		<li>Negozio</li>
		<li>Contatti</li>
		<li><a href="login.jsp">Login</a></li>
	</ul>
</nav>



<br><br>