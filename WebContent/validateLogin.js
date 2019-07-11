function validate(){
  var username = document.getElementById('username');
  var password = document.getElementById('password');
  var errorBox = document.getElementById('errorMessage');

  //controllo email
  if (!validaUser(username)) {
    errorBox.innerHTML = '<strong>Attenzione!</strong> Errore nell\'inserire l\' email.' + "</div> ";
    username.focus();
    return false;
  }
  if(!validaPassword(password)){
    errorBox.innerHTML = '<strong>Attenzione!</strong> Errore nell\'inserire la password.' + "</div> ";
    password.focus();
    console.log(password.value);
    return false;
  }
  return true;
}
function validaUser(email) {
  var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
  if(email.value.match(mailformat)){
    return true;
  }else {
    return false;
  }
}
function validaPassword(password){
  return ((/^[a-zA-Z0-9]{8,16}$/.test(password.value)) &&
          /[A-Z]/.test(password.value) &&
          /[a-z]/.test(password.value) &&
          /[0-9]/.test(password.value));
}
