$(document).on('turbolinks:load', function() {
  'use strict';

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
});
