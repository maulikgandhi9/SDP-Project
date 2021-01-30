/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


var getbtn_book = document.getElementsByClassName("getbtn_book");
for (let i of getbtn_book) {

    i.addEventListener('click', function () {
        console.log(i);
        console.log(i.id)
        swal({
            title: "Are you sure?",
            text: "Once requested, you will not be able to undo the request!",
            icon: "warning",
            buttons: true,
            dangerMode: true,
        }).then((willDelete) => {
            if (willDelete) {
                var form = document.getElementById(i.id);
                debugger;
                form.submit();
            } else {

            }
        });
    });
}
var getbtn_equ = document.getElementsByClassName("getbtn_equ");



for (let i of getbtn_equ) {

    i.addEventListener('click', function () {
    swal({
        title: "Are you sure?",
        text: "Once requested, you will not be able to undo the request!",
        icon: "warning",
        buttons: true,
        dangerMode: true,
    }).then((willDelete) => {
        if (willDelete) {
            var form = document.getElementById(i.id);
                debugger;
            form.submit();
        }
    })
});
}
