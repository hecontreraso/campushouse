# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ready page:load', ->

	if $('.residences').length != 0
		console.log "entered"
		$('.delete-picture-link').on 'ajax:success', (evt, data, status, xhr) ->
			console.log "entered entered"
			this.closest('.picture-container').remove()
			return
