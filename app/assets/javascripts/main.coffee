jQuery ->
  $(window).on "scroll", ->
    scrollControl = $(".header-scroll-target").offset() and $(window).scrollTop() < ($(".header-scroll-target").offset().top) * .625
    $(".header-scroll #header").toggleClass "transparent", scrollControl

  return
