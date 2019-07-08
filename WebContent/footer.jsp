<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*, ecommerce.controller.*, ecommerce.model.*"%>

<div class="footer">
      <div class="north">
        <div class="north-left">
          <div class="indirizzo">
            <i class="fa fa-map-marker"></i>
  					<p> Contrada Lenze 24 Fisciano, Salerno</p>
          </div>
          <div class="mail">
            <i class="fa fa-envelope"></i>
  					<p><a href="mailto:support@company.com">support@saporecampano.com</a></p>
          </div>
          <div class="telefono">
					<i class="fa fa-phone"></i>
					<p>+39 338-4221483</p>
          </div>
        </div>
        <div class="north-center">
          <h3>La consegna è gratuita per ordini superiori a 80&euro;</h3>
          <p>I tuoi acquisti su Sapore Campano sono sicuri ed affidabili, cosa aspetti?</p>
          <ul>
            <li><i class="fab fa-cc-visa"></i></li>
            <li><i class="fab fa-cc-paypal"></i></li>
            <li><i class="fab fa-cc-mastercard"></i></li>
            <li><i class="fab fa-cc-amex"></i></li>
            <li><i class="fab fa-cc-amazon-pay"></i></li>
            <li><i class="fab fa-cc-apple-pay"></i></li>
          </ul>
        </div>
        <div class="north-right">
          <ul>
            <li><a href="categoria-prodotto.jsp?cat=tutte">Tutti i prodotti</a></li>
            <% 
    		String str=null;
    		Utente u = (Utente) request.getSession().getAttribute("utente");
    		if(u==null){
    			str="./login.jsp";
    		} else if(u.getIs_Admin()==1){
    			str="./adminFilter/gestioneSito.jsp";
    		}else{
    			str="./clienteFilter/mio-profilo.jsp";
    		}
    		%>
            <li><a href=<%= str%>>Il mio account</a></li>
            <li><a href="carrello.jsp">Carrello</a></li>
            <li><a href="#">Privacy</a></li>
            <li><a href="#">Spedizione e consegna</a></li>
          </ul>
        </div>
      </div>
      
      <div class="south">
        <div class="social">
          <p>Seguici su: </p>
          <ul>
            <li><a href="https://it-it.facebook.com/" alt="fb"></a></li>
            <li><a href="https://www.instagram.com/?hl=it" alt="ig"></a></li>
            <li><a href="https://www.youtube.com/?gl=IT&hl=it" alt="yt"></i></a></li>
          </ul>
        </div>
        <div class="informazioni">
          <p>Sapore Campano Srl P.IVA 00824145621 | Sito realizzato da Armando Conte, Raffaele Di Pasca e Mario Inglese</p>
        </div>
      </div>
    </div>
