# initialize the autofill functionality in the form

$(document).on 'ready page:load', ->
	if $('.home').length != 0
		initializeAutocomplete = ->
		  input = document.getElementById('search_field')
		  new (google.maps.places.Autocomplete)(input, componentRestrictions: country: 'co')
		  return

		google.maps.event.addDomListener window, 'load', initializeAutocomplete
