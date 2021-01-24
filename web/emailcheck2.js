/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


var emailErrorMessage = document.getElementById('errorMessage');
var passwordErrorMessage = document.getElementById('passwordCheck');
var fnameErrorMessage = document.getElementById('fnamecheck');


var loginButton = document.getElementById('signup');
var emailDOM = document.getElementById('uemail');
var fnameDOM=document.getElementById('fname');



var isEmailValid = false;
var arePasswordsMatching = false;
var isfnameValid=false;

fnameDOM.addEventListener('keyup',function(){
    
    toggleMessageFname();
    toggleButton();
});
emailDOM.addEventListener('keyup', function () {
    var email = emailDOM.value;
    if (email.match(/[\w]+@ddu\.ac\.in/g) === null) {
        emailErrorMessage.textContent = "Please enter valid DDU email id";
        isEmailValid = false;
    } else {
        emailErrorMessage.textContent = "";
        isEmailValid = true;
    }
    toggleMessageFname();
    
    
    toggleButton();
});

var confirmPassword = document.getElementById('ucpwd');
var password = document.getElementById('upwd');

confirmPassword.addEventListener('keyup', function () {
    var pwd1 = password.value;
    var pwd2 = confirmPassword.value;
    toggleMessage(pwd1, pwd2);
});

password.addEventListener('keyup', function () {
    var pwd1 = password.value;
    var pwd2 = confirmPassword.value;
    toggleMessage(pwd1, pwd2);
});


function toggleMessageFname(){
    if(fnameDOM.value!==''){
        isfnameValid=true;
        fnameErrorMessage.textContent="";
    }
    else{
        isfnameValid=false;
        fnameErrorMessage.textContent="Please enter firstname";
    }
    toggleButton();
}
function toggleMessage(pwd1, pwd2) {
    if (pwd1 === pwd2) {
        passwordErrorMessage.textContent = "";
        arePasswordsMatching = true;
    } else {
        passwordErrorMessage.textContent = "Password and confirm password do not match";
        arePasswordsMatching = false;
    }
    
    
    toggleButton();
}

function toggleButton() {
    if (isEmailValid && arePasswordsMatching && isfnameValid)
        loginButton.disabled = false;
    else
        loginButton.disabled = true;
}



