/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


var selector = document.getElementById('errorMessage');

var loginButton = document.getElementById('reset');

var emailDOM=document.getElementById('uemail');
var passwordDOM=document.getElementById('upwd');

var isemailValid=false;
emailDOM.addEventListener('keyup',function(){
    var email = emailDOM.value;
    if(email.match(/[\w]+@ddu\.ac\.in/g) === null){
        selector.textContent="Please enter valid DDU email";
//        loginButton.disabled=true;
          isemailValid=false;
    }
    else{
        selector.textContent="";
        isemailValid=true;
    }
    toggleButton();
});


function toggleButton(){
    if(isemailValid){
        loginButton.disabled=false;
    }
    else
        loginButton.disabled=true;
}

