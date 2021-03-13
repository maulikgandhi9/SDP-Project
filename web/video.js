/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


var videoDOM = document.querySelectorAll("video");
//debugger;
//var mouseEnter = (mouseenter) => toggle()
for (let i of videoDOM) {
    console.log(i);
    i.addEventListener('mouseenter', () => toggle(i));
    i.addEventListener('mouseleave', () => toggle(i));
}

var toggle1 = false;
function toggle(i) {
    toggle1 = !toggle1;
    if (toggle1) {
        i.setAttribute('controls', true);
    } else {
        i.removeAttribute('controls');

    }
}

//$('.video').parent().click(function () {
//    if ($(this).children(".video").get(0).paused) {
//        $(this).children(".video").get(0).play();
//        $(this).children(".playpause").fadeOut();
//    } else {
//        $(this).children(".video").get(0).pause();
//        $(this).children(".playpause").fadeIn();
//    }
//});