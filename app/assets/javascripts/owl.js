$(document).on('turbolinks:load', function() {
  var mainOwl = $("#owl-main");
  var bars;
  var dots;
  var updateBarClasses;

  mainOwl.owlCarousel({
    items: 1,
    nav: true
  }).on('changed.owl.carousel', function(event) {
    updateBarClasses(bars.eq(event.item.index));
  });

  bars = $("#owl-bar>div");
  dots = mainOwl.find('.owl-dots>div');

  updateBarClasses = function(bar) {
    bars.select('.active').removeClass('active');
    bar.addClass('active');
  }

  bars.on('click', function() {
    var bar = $(this);
    var num = bars.index(bar);
    dots.eq(num).click();

    updateBarClasses(bar);
  });
});
