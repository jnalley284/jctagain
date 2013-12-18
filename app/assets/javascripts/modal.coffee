$ ->
	validate_count = 0
	registered = false
	$("#registration-modal").bind 'ajax:success', (e,data,status) ->
		registered = true
		$("#registration-modal").addClass 'success'
		$('.success-view').addClass 'show'

		callback = ->
			window.location.href = '/projects/new'
		setTimeout callback, 1000

		return false

	$("#registration-modal").bind 'ajax:error', (e,data,status) ->
		errors = data.responseJSON
		if errors
			$("#registration-modal").find('.errors').html('')
			$.each errors, (item) =>
				error = "<p>#{errors[item]}</p>"
				$("#registration-modal").find('.errors').append(error)

	$('.close-reveal-modal').on 'click', (e) ->
		if registered
			window.location.href = '/projects/new'
