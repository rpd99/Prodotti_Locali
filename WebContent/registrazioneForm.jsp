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
    <div id="logo">
        <img src="logo.png" alt="logo">
    </div>
    <div id="errorMessage">
    <% if(request.getAttribute("formError")!=null){
    	%><h1 style="color:red"><%=request.getAttribute("formError")%></h1>
    <%} %>
    </div>
      <form  method="post" onSubmit="return validateRegistrazione()" action="LoginRegister" >
        <div class="textbox-registrazione">
          <div class="nomeCognome">
            <input type="text" placeholder="Nome" name="nome" value="<%if(request.getParameter("nome")!=null){%><%=request.getParameter("nome")%><%} %>" required>
            <input type="text" placeholder="Cognome" name="cognome" value="<%if(request.getParameter("cognome")!=null){%><%=request.getParameter("cognome")%><%} %>" required>
          </div>
        </div>

        <div class="textbox-registrazione">
          <input type="text" placeholder="name@example.com" id="username" name="email" value="<%if(request.getParameter("email")!=null){%><%=request.getParameter("email")%><%} %>">
        </div>
        <div class="textbox-registrazione">
          <input type="password" required placeholder="Password" onfocus="functionFocus()" onblur="functionBlur()" id="password" name="password">
        </div>

        <div id="passwordMessage">
          <div class="alert alert-info" role="alert">
            <strong>Attenzione!</strong> La password deve essere lunga minimo 8 caratteri e deve contenere almeno un carattere maiuscolo, minuscolo e un numero.
          </div>
      </div>
        <div class="textbox-registrazione">
          <input type="password" required placeholder="Conferma Password" id="password2" name="password2">
        </div>
        <div class="privacy">
            <input type="checkbox" name="checkbox" value="check" id="privacy1"> &nbsp;Ho letto l'<a href="">informativa privacy</a>
        </div>
        <input type="submit" value="Registrati" class="submit">

    </form>
  </div>
  </body>
</html>
