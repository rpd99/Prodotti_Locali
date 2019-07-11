<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="style-login.css">
    <script src="validateForm.js"></script>
    <title>Login</title>
  </head>
  <body>
  <div id="template">
  <form class="box" action="Login" method="post" onSubmit="return validateLogin();">
    <div id="logo">
      <img src="logo.png" alt="logo">
	</div>
	
	<div id="errorMessage">
	<% if(request.getAttribute("formError")!=null){
    	%><h1 style="color:red; font-size: 16px"><%=request.getAttribute("formError")%></h1>
    <%} %>
	</div>
	<div class="textbox">
		<input type="text" name="username" placeholder="Username" id="username" >
	</div>
	<div class="textbox">
		<input type="password" name="password" placeholder="Password" id="password">
	</div>

	<input type="submit" name="login" value="Login" class="submit">

  </form>
  <br>
  <div class="registra">
    <p> Non sei ancora registrato? <a href="registrazioneForm.jsp">Clicca qui per registrarti</a></p>
  </div>

  </div>
  </body>
</html>
