$(document).ready(function(){
  $(".button-collapse").sideNav();
  $('.carousel').carousel();
  $('.collapsible').collapsible();
  $('.parallax').parallax();
  $('.slider').slider();
});
$('.carousel.carousel-slider').carousel({fullWidth: true});
$('.prevPic').click(function(){
  $('.slider').slider('prev');
});
$('.nextPic').click(function(){
  $('.slider').slider('next');
});
