$(document).on 'ready page:load', ->
	if $('.search').length != 0
		itemsPerPage = 6

		# // This method displays the residences in the left panel.
		# // Is called on page load (by the initialize pagination method),
		# // when some pagination button is clicked, and when the map is dragged.
		loadResidences = (residences_to_show)->
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

		# // Initialize the pagination buttons 
		initializePagination = ->
			totalPages = Math.ceil(residences.length/itemsPerPage)

			$('#pagination').twbsPagination
				totalPages: totalPages
				visiblePages: 7
				onPageClick: (event, page) ->
					baseIndex = (page - 1) * itemsPerPage
					loadResidences residences.slice(baseIndex, itemsPerPage * page)
					return
			return

		initializePriceSlider = ->
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

		initializeMap = ->
			map = undefined
			mapCanvas = undefined
			mapOptions = undefined
			mapCanvas = document.getElementById('map')
			mapOptions =
				center: new (google.maps.LatLng)(map_latitude, map_longitude)
				zoom: 15
				maxZoom: 15
				mapTypeId: google.maps.MapTypeId.ROADMAP
				mapTypeControl: false
			map = new (google.maps.Map)(mapCanvas, mapOptions)

			# // Render the residence markers on map (all residences)
			for residence in residences
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

			# // Render the university marker on map
			new (google.maps.Marker)(
				position: {lat: parseFloat(university.latitude), lng: parseFloat(university.longitude)},
				map: map,
				icon: university_marker_url
			)

			# // Set style for map
			map_style = [{"featureType":"administrative","elementType":"all","stylers":[{"visibility":"on"},{"lightness":33}]},{"featureType":"landscape","elementType":"all","stylers":[{"color":"#f2e5d4"}]},{"featureType":"poi.park","elementType":"geometry","stylers":[{"color":"#c5dac6"}]},{"featureType":"poi.park","elementType":"labels","stylers":[{"visibility":"on"},{"lightness":20}]},{"featureType":"road","elementType":"all","stylers":[{"lightness":20}]},{"featureType":"road.highway","elementType":"geometry","stylers":[{"color":"#c5c6c6"}]},{"featureType":"road.arterial","elementType":"geometry","stylers":[{"color":"#e4d7c6"}]},{"featureType":"road.local","elementType":"geometry","stylers":[{"color":"#fbfaf7"}]},{"featureType":"water","elementType":"all","stylers":[{"visibility":"on"},{"color":"#acbcc9"}]}]
			map.setOptions({styles: map_style})

			# // 1. Send the new center of the map
			# // 2. Render the new markers
			# // 3. Render the new residences
			map.addListener 'dragend', (e)->
				new_center = map.getCenter()
				
				# // enviar petición ajax con new_center
				# // Actualizar los pines con las nuevas residencias
				# // Actualizar los recuadros de la izquierda

				# // AÑADIR MUCHAS RESIDENCIAS, UNAS 24.
				# // PROBAR EL PAGINADO
				# // PROGRAMAR EL DRAG EN ESTE MÉTODO
				# // PROGRAMAR EL SLIDER PARA QUE FUNCIONE
				return

			return

		initializePagination()
		initializePriceSlider()
		google.maps.event.addDomListener window, 'load', initializeMap
