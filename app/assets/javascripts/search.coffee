$(document).on 'ready page:load', ->

	if $('.search').length != 0
		initializeMap()
		initializePagination()
		window.slider = initializePriceSlider()

		# // Set style for map
		map_style = [{"featureType":"administrative","elementType":"all","stylers":[{"visibility":"on"},{"lightness":33}]},{"featureType":"landscape","elementType":"all","stylers":[{"color":"#f2e5d4"}]},{"featureType":"poi.park","elementType":"geometry","stylers":[{"color":"#c5dac6"}]},{"featureType":"poi.park","elementType":"labels","stylers":[{"visibility":"on"},{"lightness":20}]},{"featureType":"road","elementType":"all","stylers":[{"lightness":20}]},{"featureType":"road.highway","elementType":"geometry","stylers":[{"color":"#c5c6c6"}]},{"featureType":"road.arterial","elementType":"geometry","stylers":[{"color":"#e4d7c6"}]},{"featureType":"road.local","elementType":"geometry","stylers":[{"color":"#fbfaf7"}]},{"featureType":"water","elementType":"all","stylers":[{"visibility":"on"},{"color":"#acbcc9"}]}]
		map.setOptions({styles: map_style})
		
		# // 1. Send the new center of the map
		# // 2. Render the new markers
		# // 3. Render the new residences
		map.addListener 'dragend', (e)->
			if map.getZoom() >= 15
				getAndLoadResidences()
			return

		loadMarkers(residences)

		return


# // This method displays the residences in the left panel.
# // Is called on page load (by the 'initializePagination' method),
# // when some pagination button is clicked, and when the map is dragged.
loadLeftPanel = (residences_to_show)->
	$('section.residences').empty()

	for residence in residences_to_show
		residence_html = $('#residence_template').clone()
		residence_html.attr('hidden', false)

		residence_html.attr("id","residence-"+residence.id);
		residence_html.find('img').attr('src', residence.picture)
		residence_html.find('.residence-title').text(residence.name)
		residence_html.find('.price').text(residence.price)

		$('section.residences').append(residence_html)
	return


# // This method displays the markers of residences in the right panel.
# // Is called on page load (by the 'initializeMap' method),
# // and when the map is dragged.
loadMarkers = (residences_to_show) ->

	# // Render the university marker on map
	new (google.maps.Marker)(
		position: {lat: parseFloat(university.latitude), lng: parseFloat(university.longitude)},
		map: map,
		icon: university_marker_url
	)
	for residence in residences_to_show
		marker = new (google.maps.Marker)(
			position: {lat: parseFloat(residence.latitude), lng: parseFloat(residence.longitude)},
			map: map,
			icon: residence_marker_url
		)

		# // Changes the background-color of the associated listing on mouseover
		marker.addListener 'mouseover', ((residence_id, marker_copy) ->
			->
				marker_copy.setIcon(residence_marker_gray_url	)
				$('#residence-' + residence_id).css("background-color", "rgba(77, 201, 3, 0.3)")
				return
		)(residence.id, marker)
		
		# // Restore the background-color of the associated listing on mouseout
		marker.addListener 'mouseout', ((residence_id) ->
			->
				$('#residence-' + residence_id).css("background-color", "#f8f8f8")
				return
		)(residence.id)
	return


# // Initialize the pagination buttons 
initializePagination = ->
	totalPages = Math.ceil(residences.length/itemsPerPage)

	$('#pagination').twbsPagination
		totalPages: totalPages
		visiblePages: 7
		onPageClick: (event, page) ->
			baseIndex = (page - 1) * itemsPerPage
			loadLeftPanel residences.slice(baseIndex, itemsPerPage * page)
			return
	return


initializePriceSlider = ->
	$('#price').freshslider
		range: true
		step: 10000
		text: true
		min: parseInt(min_search_price)
		max: parseInt(max_search_price)
		enabled: true
		value: 10
		onchange: (low, high) ->
			getAndLoadResidences()
			return


getAndLoadResidences = ->
	if typeof slider == "undefined"
		console.log "undefined, not entering function"
		return

	$ .ajax search_ajax_path,
		accepts: 'application/json'
		data:
			lat: map.getCenter().lat()
			lng: map.getCenter().lng()
			min_price: slider.getValue()[0]
			max_price: slider.getValue()[1]
		success: (data) ->
			loadLeftPanel data
			loadMarkers(data)
			return
		error: (data) ->
			console.log 'No se pudieron traer las residencias desde el servidor'
			return
	return


initializeMap = ->
	map = undefined
	mapCanvas = undefined
	mapOptions = undefined
	mapCanvas = document.getElementById('map')
	mapOptions =
		center: new (google.maps.LatLng)(map_latitude, map_longitude)
		zoom: 15
		mapTypeId: google.maps.MapTypeId.ROADMAP
		mapTypeControl: false
	window.map = new (google.maps.Map)(mapCanvas, mapOptions)
	return
 