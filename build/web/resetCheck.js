/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


var emailErrorMessage = document.getElementById('errorMessage');
var passwordErrorMessage = document.getElementById('passwordCheck');


var resetButton = document.getElementById('reset');

var arePasswordsMatching = false;



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
    if (arePasswordsMatching)
        resetButton.disabled = false;
    else
        resetButton.disabled = true;
}



