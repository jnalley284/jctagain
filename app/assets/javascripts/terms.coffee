# Scroll to terms sections
$ ->
	$(".side-nav a").click (e) ->
	  e.preventDefault()
	  $link = $($(this).attr('href'))

	  $("html, body").animate
	    scrollTop: ($link.offset().top) - 112
	  , 500

# Waypoints Scrolling
$ ->
	$(".terms-title").waypoint (->
		$(".side-nav li").removeClass "in-view"
		$("#" + $(this).data("title")).addClass "in-view"
		),
			offset: 112

$ ->
	$(".footer-wrapper").waypoint (->
		$('.sidebar').toggleClass('move-up')
		),
			offset: $(window).height() - 60