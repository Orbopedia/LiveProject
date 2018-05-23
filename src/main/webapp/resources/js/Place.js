$(document).ready(function(){
    $('.sidenav').sidenav();
    $('.parallax').parallax();
    $('.carousel').carousel();
    $('.slider').slider();
    $('.modal').modal();
});

$('.carousel.carousel-slider').carousel({fullWidth:true});
$('.prevPic').click(function(){
    $('.slider').slider('prev');
});
$('.nextPic').click(function(){
    $('.slider').slider('next');
});
