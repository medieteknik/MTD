jQuery ->
  # listen to window scroll
  $(window).on "scroll", ->
    # toggle detached class to header if scrolled below headers height
    $("#header").toggleClass "detached", $(window).scrollTop() > $("#header").height()

$(document).ready ->
  # control mobile menu
  $('.togglemenu').click ->
    $('body').toggleClass 'expand-nav'
