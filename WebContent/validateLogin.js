function validate(){
  var username = document.getElementById('username');
  var password = document.getElementById('password');
  var errorBox = document.getElementById('errorMessage');

  var alertDiv = '<div class="alert alert-danger alert-dismissibile" role="alert">';
  var alertBtn = '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>';
  //controllo email
  if (!validaUser(username)) {
    errorBox.innerHTML = alertDiv + alertBtn +'<strong>Attenzione!</strong> Errore nell\'inserire l\' email.' + "</div> ";
    username.focus();
    return false;
  }
  if(!validaPassword(password)){
    errorBox.innerHTML = alertDiv + alertBtn +'<strong>Attenzione!</strong> Errore nell\'inserire la password.' + "</div> ";
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
