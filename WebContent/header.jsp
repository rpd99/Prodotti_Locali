<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*, ecommerce.controller.*, ecommerce.model.*"%>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="ricerca.js"></script>

<%
	Collection<?> categories = (Collection<?>)request.getAttribute("categories"); 
	Carrello cart = (Carrello)request.getSession().getAttribute("carrello");
	int quantCarrello = 0;
	if(cart != null){
		quantCarrello = cart.getSize();
	}
	
%>


<div class="header">
    <div class="header-left">
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
        <a href="./chiSiamo.jsp">Chi siamo</a>
    </div>

    <div class="header-center">
      <a href="index.jsp" class="logo"><img src="logo.png" alt="logo"></a>
    </div>

    <div class="header-right">
    	<% 
    		String str=null;
    		if(request.getSession().getAttribute("utente")==null){
    			str="./login.jsp";
    		}else{
    			str="./clienteFilter/mio-profilo.jsp";
    		}
    		%>
  
        <a href=<%= str%>>Il mio profilo</a>
        <a href="./carrello.jsp">Carrello<sup>(<%=quantCarrello %>)</sup></a>
        <div>        	
       		<input type="text" name="search" id="search" placeholder="cerca..." onkeyup="ricerca()">
       		<div id="result">
       		</div>
        </div>
    </div>
  </div>


<br><br>