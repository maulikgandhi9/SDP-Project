/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var delBook=document.getElementById("delBook");
var delEqu=document.getElementById("delEqu");

delBook.addEventListener('click', function(){
   swal({
  title: "Are you sure?",
  text: "Once deleted, you will not be able to undo the post!",
  icon: "warning",
  buttons: true,
  dangerMode: true
}) 

.then((willDelete) => {
  if (willDelete) {
        var form = document.getElementById("bookDelete");
        form.submit();
  } else {
    
  }
});
});


delEqu.addEventListener('click', function(){
   swal({
  title: "Are you sure?",
  text: "Once deleted, you will not be able to undo the post!",
  icon: "warning",
  buttons: true,
  dangerMode: true
}) 

.then((willDelete) => {
  if (willDelete) {
        var form = document.getElementById("equDelete");
        form.submit();
  } else {
    
  }
});
});