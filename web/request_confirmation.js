/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


var getbtn_book=document.getElementById("getbtn_book");
var getbtn_equ=document.getElementById("getbtn_equ");


getbtn_book.addEventListener('click', function(){
   swal({
  title: "Are you sure?",
  text: "Once requested, you will not be able to undo the request!",
  icon: "warning",
  buttons: true,
  dangerMode: true,
}) 

.then((willDelete) => {
  if (willDelete) {
        var form = document.getElementById("bookRequest");
        form.submit();
  } else {
    
  }
});
});

getbtn_equ.addEventListener('click', function(){
   swal({
  title: "Are you sure?",
  text: "Once requested, you will not be able to undo the request!",
  icon: "warning",
  buttons: true,
  dangerMode: true,
}) 

.then((willDelete) => {
  if (willDelete) {
        var form = document.getElementById("equRequest");
        form.submit();
  } else {
    
  }
});
});