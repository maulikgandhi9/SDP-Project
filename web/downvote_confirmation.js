/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


var downbtn = document.getElementsByClassName("upbtn");
//
for (let i of downbtn) {

    i.addEventListener('click', function () {
        console.log(i);
        console.log(i.id)
        swal({
            title: "Are you sure?",
            text: "Once upvoted this book, you will not be able to undo your upvote!",
            icon: "warning",
            buttons: true,
            dangerMode: true
        }).then((willDelete) => {
            if (willDelete) {
                
                var button = document.getElementById(i.id);
                console.log("see here "+button);
                   debugger;
//                        form.type="submit";
                button.submit();

            } else {

            }
        });
    });
}

