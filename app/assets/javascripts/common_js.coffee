$(document).ready ->
	# Show the flash messages for 3 seconds then hide it
	$('.alert').delay(3000).fadeOut(500)

	# Change the modals from sign in to register and viceversa
	$('.change-modal').click ->
		if $('#Register').css('display') == 'block'
		  $('#Register').modal 'hide'
		  $('#SignIn').modal 'show'
		else if $('#SignIn').css('display') == 'block'
		  $('#SignIn').modal 'hide'
		  $('#Register').modal 'show'
	  return
