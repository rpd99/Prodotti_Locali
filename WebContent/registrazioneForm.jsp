<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*, ecommerce.controller.*, ecommerce.model.*"%>
 
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registrazione</title>
<link rel="stylesheet" type="text/css" href="layout.css" />
</head>
<body>
	<jsp:include page="header.jsp"/>
	
	<form action="registrazioneControl" method="post">
		Nome: <input type="text" placeholder="mario" required><br>
		Cognome: <input type="text" placeholder="inglese" required><br>
		Email: <input type="text" placeholder="mario@gmail.com" required><br>
		Telefono: <input type="text" placeholder="3333333333" required><br>
		CAP: <input type="text" placeholder="30" required><br>
		Via: <input type="text" placeholder="via bella" required><br>
		Numero civico: <input type="text" placeholder="83040" required><br>
		Nazione: <input type="text" placeholder="italia" required><br>
		Città: <input type="text" placeholder="Roma" required><br>
		Password: <input type="password" required><br>
		<hr>
		<input type="submit" value="Registrati"><br>
		
		
	</form>
	
</body>
</html>