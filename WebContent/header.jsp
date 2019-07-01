<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*, ecommerce.controller.*, ecommerce.model.*"%>

<% Collection<?> categories = (Collection<?>)request.getAttribute("categories"); %>



<div class="header">
    <div class="header-right">
        <div class="dropdown">
    			<a href="categoria-prodotto.jsp?cat=tutte">Tutti i nostri prodotti</a>
          <div class="dropdown-content">
          	<ul>
            <%
				if(categories != null && categories.size() > 0) {

					Iterator<?> it = categories.iterator();
					while(it.hasNext()){
						Categoria bean = (Categoria)it.next();
				%>
				<a href="categoria-prodotto.jsp?cat=<%=bean.getNome() %>"><li><%=bean.getNome()%></li></a>
				<%}} %>
			</ul>
          </div>
      </div>
        <a href="#about">Chi siamo</a>
    </div>

    <div class="header-center">
      <a href="index.jsp" class="logo"><img src="logo.png" alt="logo"></a>
    </div>

    <div class="header-left">
    	<% 
    		String str=null;
    		if(request.getSession().getAttribute("utente")==null){
    			str="./login.jsp";
    		}else{
    			str="./clienteFilter/mio-profilo.jsp";
    		}
    		%>
  
        <a href=str>Il mio profilo</a>
        <a href="./carrello.jsp">Carrello</a>
    </div>
  </div>




<br><br>