<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*, ecommerce.controller.*, ecommerce.model.*"%>
 
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<link rel="stylesheet" type="text/css" href="layout.css" />
</head>
<body>
	<jsp:include page="header.jsp"/>
	
	<form action="loginControl" method="post">
		Email: <input type="text" placeholder="mario@gmail.com" required><br>
		Password: <input type="password" required><br>
		<input type="submit" value="Login"><br>
		<hr>
		
		<a href="./registrazioneForm.jsp">Se non sei registrato clicca qui!!!!</a>
	</form>
	
</body>
</html>