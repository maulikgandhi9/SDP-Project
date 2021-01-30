/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var delBook = document.getElementsByClassName("delBook");
for (let i of delBook) {

    i.addEventListener('click', function () {
        console.log(i);
        console.log(i.id)
        swal({
            title: "Are you sure?",
            text: "Once deleted, you will not be able to undo the post!",
            icon: "warning",
            buttons: true,
            dangerMode: true
        }).then((willDelete) => {
            if (willDelete) {
                var button = document.getElementById(i.id);
                   debugger;
//                        form.type="submit";
                button.submit();

            } else {

            }
        });
    });
}
var delEqu = document.getElementsByClassName("delEqu");

for (let i of delEqu) {

    i.addEventListener('click', function () {
        console.log(i);
        swal({
            title: "Are you sure?",
            text: "Once deleted, you will not be able to undo the post!",
            icon: "warning",
            buttons: true,
            dangerMode: true
        })

                .then((willDelete) => {
                    if (willDelete) {
                        var form = document.getElementById(i.id);
                        debugger;
//                        form.type="submit";
                        form.submit();


                    } else {

                    }
                });
    });
}

