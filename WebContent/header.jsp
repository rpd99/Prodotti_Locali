<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*, ecommerce.controller.*, ecommerce.model.*"%>

<% Collection<?> categories = (Collection<?>)request.getAttribute("categories"); %>

<a href=""><img src="facebook"></a>
<a href=""><img src="facebook"></a>

<hr>

<div class="header">
    <div class="header-right">
        <div class="dropdown">
    			<a href="categoria-prodotto.jsp?cat=tutte">Tutti i nostri prodotti</a>
          <div class="dropdown-content">
            <%
				if(categories != null && categories.size() > 0) {

					Iterator<?> it = categories.iterator();
					while(it.hasNext()){
						Categoria bean = (Categoria)it.next();
				%>
				<a href=""><li><%=bean.getNome()%></li></a>
				<%}} %>
			</ul>
          </div>
      </div>
        <a href="#about">Chi siamo</a>
    </div>

    <div class="header-center">
      <a href="#default" class="logo"><img src="logo.png" alt="logo"></a>
    </div>

    <div class="header-left">
        <a href="#contact">Contatti</a>
        <a href="#about">Il mio profilo</a>
    </div>
  </div>




<br><br>