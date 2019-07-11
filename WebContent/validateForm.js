function validateLogin(){
  var username = document.getElementById('username');
  var password = document.getElementById('password');
  var errorBox = document.getElementById('errorMessage');

  //controllo email
  if (!validaUser(username)) {
    errorBox.innerHTML = '<strong>Attenzione!</strong> Errore nell\'inserire l\' email.';
    username.focus();
    return false;
  }
  if(!validaPassword(password)){
    errorBox.innerHTML = '<strong>Attenzione!</strong> Errore nell\'inserire la password.';
    password.focus();
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
function isEquals(password,password2){
  if(password.value==password2.value){
    console.log(password.value+""+password2.value);
    return true;
  }else {console.log("falso"+password.value+""+password2.value);
      return false;
    }
}
function isChecked(checkBox){
  if (checkBox.checked == true) {
      console.log("è cliccato");
      return true;
  }else {
    console.log("non è cliccato");
    return false;
  }
}

function isPresent(){
	
	var xmlHttpReq = new XMLHttpRequest();
	
		 xmlHttpReq.onreadystatechange = function() {
			if (xmlHttpReq.readyState == 4 && xmlHttpReq.status == 200 && xmlHttpReq.responseText == '<ok/>') {
					
			} else {
					
			}
		}
		xmlHttpReq.open("GET", "VerificaUsername?email="+ encodeURIComponent(email.value), true);
		xmlHttpReq.send();
		
}
function functionFocus(){
  var passwordBox = document.getElementById('passwordMessage');
  passwordBox.style.display = "block";
  var template = document.getElementById('template');
  template.style.height = "500px";
  return true;
}

function functionBlur(){
  var passwordBox = document.getElementById('passwordMessage');
  passwordBox.style.display = "none";
  var template = document.getElementById('template');
  template.style.height = "400px";

}
function validateRegistrazione(){
  

  var errorBox = document.getElementById('errorMessage');

  
  var username = document.getElementById('username');
  var password = document.getElementById('password');
  var password2 = document.getElementById('password2');
  var checkBox = document.getElementById('privacy1');

  if (!validaUser(username)) {
    errorBox.innerHTML = '<strong>Attenzione!</strong> Errore nell\'inserire l\' email.' + "</div> ";
    username.focus();
    return false;
  }
  if(!isEquals(password,password2)){
    errorBox.innerHTML = '<strong>Attenzione!</strong> Le password non coincidono' + "</div> ";
    return false;
  }
  if(!validaPassword(password)){
    errorBox.innerHTML = '<strong>Attenzione!</strong> Errore nell\'inserire la password.' + "</div> ";
    password.focus();
    return false;
  }
  if (!isChecked(checkBox)){
        errorBox.innerHTML = '<strong>Attenzione!</strong> Bisogna accettare le condizioni sulla privacy' + "</div> ";
        return false;
  }
  return true;
}
