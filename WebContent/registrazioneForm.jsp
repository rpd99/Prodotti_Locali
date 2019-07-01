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
    <script src="validateForm.js"></script>
    <title>Login</title>
  </head>
  <body>

  <div id="template">
    <div id="logo">
        <img src="logo.png" alt="logo">
    </div>
    <div id="errorMessage"></div>
      <form  method="post" onSubmit="return validateRegistrazione()" action="LoginRegister" >
        <div class="textbox-registrazione">
          <div class="nomeCognome">
            <i class="fas fa-user"></i>
            <input type="text" placeholder="Nome" name="nome" required>
            <input type="text" placeholder="Cognome" name="cognome" required>
          </div>
        </div>

        <div class="textbox-registrazione">
          <i class="fas fa-envelope"></i>
          <input type="text" placeholder="name@example.com" id="username" name="email">
        </div>
        <div class="textbox-registrazione">
          <i class="fas fa-unlock" aria-hidden="true"></i>
          <input type="password" required placeholder="Password" onfocus="functionFocus()" onblur="functionBlur()" id="password">
        </div>

        <div id="passwordMessage">
          <div class="alert alert-info" role="alert">
            <strong>Attenzione!</strong> La password deve esssere lunga minima 8 caratteri e deve contenere almeno un carattere maiuscolo, minuscolo e un numero.
          </div>
      </div>
        <div class="textbox-registrazione">
          <i class="fas fa-unlock" aria-hidden="true"></i>
          <input type="password" required placeholder="Conferma Password" id="password2" name="password">
        </div>
        <div class="privacy">
            <input type="checkbox" name="checkbox" value="check" id="privacy1"> &nbsp;Ho letto l'<a href="">informativa privacy</a>
        </div>
        <input type="submit" value="Registrati" class="submit">

    </form>
  </div>
  </body>
</html>
