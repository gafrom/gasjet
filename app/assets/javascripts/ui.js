$(document).on('turbolinks:load', function() {
  "use strict";
  $(".header__hamburger").on("click", function(){
    if(!$(this).hasClass("activated")){
      $(this).addClass("activated");
      $(".header__menu").addClass('header__menu_mobile-visible');
    } else {
      $(this).removeClass("activated");
      $(".header__menu").removeClass('header__menu_mobile-visible');
    }


  });

  $(window).scroll(function(){
    if($(this).scrollTop() > 100) {
      $(".header").addClass("header_compact");
    } else {
      $(".header").removeClass("header_compact");
    }
  });

  $(window).resize(function(){
    if($(this).width() >= 1024){
      $(".header__menu").removeClass('header__menu_mobile-visible');
      $(".header__hamburger").removeClass('activated')
    }
  });

  $(document).ready(function(){
    var mainOwl = $("#owl-main");
    var bars;
    var dots;
    var updateBarClasses;

    mainOwl.owlCarousel({
      items: 1,
      nav: true
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

    dots.on('click', function() {
      var num = dots.index($(this));

      updateBarClasses(bars.eq(num));
    });

  });
});
