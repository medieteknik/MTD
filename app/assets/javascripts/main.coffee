jQuery ->
  # listen to window scroll
  $(window).on "scroll", ->
    # toggle detached class to header if scrolled below headers height
    $("#header").toggleClass "detached", $(window).scrollTop() > $("#header").height()

$(document).ready ->
  # control mobile menu
  $('.togglemenu').click ->
    $('body').toggleClass 'expand-nav'

  $('[data-toggle="tooltip"]').tooltip({'container': 'body'})

  $('.album .images').magnificPopup
    delegate: 'a'
    type: 'image'
    tLoading: 'Loading image #%curr%...'
    mainClass: 'mfp-img-mobile'
    gallery:
      enabled: true
      navigateByImgClick: true
      preload: [0, 2] # will prelode 0 before, 1 after current image
    image:
      tError: '<a href="%url%">The image #%curr%</a> could not be loaded.'
      titleSrc: (item) ->
        item.el.attr('title') + '<small>MTD 2015 '+item.el.attr('data-photographer')+'</small>'
