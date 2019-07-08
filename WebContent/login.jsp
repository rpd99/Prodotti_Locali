<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="style-login.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/9ea2ff19bf.js"></script>
    <script src="validateLogin.js"></script>
    <title>Login</title>
  </head>
  <body>
  <div id="template">
  <form class="box" action="Login" method="post" onSubmit="return validateLogin();">
    <div id="logo">
      <img src="logo.png" alt="logo">
	</div>
	
	<div id="errorMessage"></div>
	<div class="textbox">
		<i class="fas fa-user"></i>
		<input type="text" name="username" placeholder="Username" id="username" >
	</div>
	<div class="textbox">
		<i class="fas fa-unlock" aria-hidden="true"></i>
		<input type="password" name="password" placeholder="Password" id="password">
	</div>

	<input type="submit" name="login" value="Login" class="submit">

  </form>
  <br>
  <div class="registra">
    <p> Non sei ancora registrato?<a href="registrazioneForm.jsp">Clicca qui per registrarti</a></p>
  </div>

  </div>
  </body>
</html>
