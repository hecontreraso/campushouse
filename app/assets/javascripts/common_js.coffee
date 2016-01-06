initialize = ->
	# Show the flash messages for 3 seconds then hide it
	$('.alert').delay(3000).fadeOut(500)

	# Change the modals from sign in to register and viceversa
	$('.change-modal').click ->
		if $('#RegisterModal').css('display') == 'block'
		  $('#RegisterModal').modal 'hide'
		  $('#SignInModal').modal 'show'
		else if $('#SignInModal').css('display') == 'block'
		  $('#SignInModal').modal 'hide'
		  $('#RegisterModal').modal 'show'
	  return

	$('.loginModalShow').click ->
	  $('#SignInModal').modal 'show'
	  return

  # This code redirects the user if register or log in succeded.
  # Otherwise, displays the errors in the forms
  $('#SignInForm, #RegisterForm').on('ajax:success', (evt, data, status, xhr) ->
    form = $(this)
    $('.modal').modal 'hide'
    window.location.href = if data.location then data.location else '/'
    return
  ).on 'ajax:error', (evt, data, status, xhr) ->
    form = $(this)
    if data.responseJSON.errors
      form.find('.form-group').removeClass 'field_with_errors'
      form.find('small').remove()
      $.each data.responseJSON.errors, (k, v) ->
        form.find('[id*=\'_' + k + '\']').parent().addClass('field_with_errors').append '<small>' + v + '</small>'
        return
    else if data.responseJSON.error
      form.find('#error_explanation').remove()
      form.prepend '<div id="error_explanation">' + data.responseJSON.error + '</div>'
    return

$(document).on 'ready page:load', initialize
