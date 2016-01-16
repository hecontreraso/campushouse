$(document).on 'ready page:load', ->
	if $('.search').length != 0
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
			map = new (google.maps.Map)(mapCanvas, mapOptions)

			# Render the residence markers on map
			for residence in residences
				marker = new (google.maps.Marker)(
					position: {lat: parseFloat(residence.latitude), lng: parseFloat(residence.longitude)},
					map: map,
					icon: residence_marker_url
				)

				# Changes the background-color of the associated listing on mouseover
				marker.addListener 'mouseover', ((residence_id, marker_copy) ->
					->
						marker_copy.setIcon(residence_marker_gray_url)
						$('#residence-' + residence_id).css("background-color", "rgba(77, 201, 3, 0.3)")
						return
				)(residence.id, marker)
				
				# Restore the background-color of the associated listing on mouseout
				marker.addListener 'mouseout', ((residence_id) ->
					->
						$('#residence-' + residence_id).css("background-color", "#f8f8f8")
						return
				)(residence.id)

			# Render the university marker on map
			new (google.maps.Marker)(
				position: {lat: parseFloat(university.latitude), lng: parseFloat(university.longitude)},
				map: map,
				icon: university_marker_url
			)

			# Set style for map
			map_style = [{"featureType":"administrative","elementType":"all","stylers":[{"visibility":"on"},{"lightness":33}]},{"featureType":"landscape","elementType":"all","stylers":[{"color":"#f2e5d4"}]},{"featureType":"poi.park","elementType":"geometry","stylers":[{"color":"#c5dac6"}]},{"featureType":"poi.park","elementType":"labels","stylers":[{"visibility":"on"},{"lightness":20}]},{"featureType":"road","elementType":"all","stylers":[{"lightness":20}]},{"featureType":"road.highway","elementType":"geometry","stylers":[{"color":"#c5c6c6"}]},{"featureType":"road.arterial","elementType":"geometry","stylers":[{"color":"#e4d7c6"}]},{"featureType":"road.local","elementType":"geometry","stylers":[{"color":"#fbfaf7"}]},{"featureType":"water","elementType":"all","stylers":[{"visibility":"on"},{"color":"#acbcc9"}]}]
			map.setOptions({styles: map_style})

			# Mostrar universidades
			# Garantizar que se muestren todas las residencias visibles al buscar desde el home

			map.addListener 'center_changed', ->
				# traer info de todas las residencias dentro del mapa. map.getCenter()
				# Actualizar los recuadros de la izquierda y los pines
			return

		google.maps.event.addDomListener window, 'load', initializeMap

		$('#price').freshslider
			range: true
			step: 1000
			text: true
			min: 100000
			max: 5000000
			enabled: true
			value: 10
			onchange: (low, high) ->
		return
