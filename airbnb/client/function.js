
$('#right-jumbotron-arrow').click(function() {
  var currentSlide = $('.slide.active');
  var nextSlide = currentSlide.next();

  currentSlide.fadeOut(300).removeClass('active');
  nextSlide.fadeIn(300).addClass('active');
});
