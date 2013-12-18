# Scroll to how does it work
$ ->
  $(".down-arrrow").click ->
    scroll = $(window).scrollTop()
    $("html, body").animate
      scrollTop: scroll + $('.hero-content').height()
    , 600