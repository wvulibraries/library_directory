$( document ).on('turbolinks:load', function() {
  $('.floor-maps').slick({
    dots: true,
    infinite: false,
    speed: 300
  });
}); 