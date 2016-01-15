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

			# Render the markers on map
			for marker in JSON.parse(markers)
				inner_marker = new (google.maps.Marker)(
					position: {lat: parseFloat(marker.lat), lng: parseFloat(marker.lon)},
					map: map,
					icon: marker_image_url
				)

				# Changes the background-color of the associated listing on mouseover
				inner_marker.addListener 'mouseover', ((marker_id_copy, inner_marker_copy) ->
					->
						inner_marker_copy.setIcon(marker_gray_image_url)
						$('#residence-' + marker_id_copy).css("background-color", "rgba(77, 201, 3, 0.3)")
						return
				)(marker.id, inner_marker)
				
				# Restore the background-color of the associated listing on mouseout
				inner_marker.addListener 'mouseout', ((marker_id_copy) ->
					->
						$('#residence-' + marker_id_copy).css("background-color", "#f8f8f8")
						return
				)(marker.id)

			map_style = [{"featureType":"landscape.man_made","elementType":"geometry","stylers":[{"color":"#f7f1df"}]},{"featureType":"landscape.natural","elementType":"geometry","stylers":[{"color":"#d0e3b4"}]},{"featureType":"landscape.natural.terrain","elementType":"geometry","stylers":[{"visibility":"off"}]},{"featureType":"poi","elementType":"labels","stylers":[{"visibility":"off"}]},{"featureType":"poi.business","elementType":"all","stylers":[{"visibility":"off"}]},{"featureType":"poi.medical","elementType":"geometry","stylers":[{"color":"#fbd3da"}]},{"featureType":"poi.park","elementType":"geometry","stylers":[{"color":"#bde6ab"}]},{"featureType":"road","elementType":"geometry.stroke","stylers":[{"visibility":"off"}]},{"featureType":"road","elementType":"labels","stylers":[{"visibility":"off"}]},{"featureType":"road.highway","elementType":"geometry.fill","stylers":[{"color":"#ffe15f"}]},{"featureType":"road.highway","elementType":"geometry.stroke","stylers":[{"color":"#efd151"}]},{"featureType":"road.arterial","elementType":"geometry.fill","stylers":[{"color":"#ffffff"}]},{"featureType":"road.local","elementType":"geometry.fill","stylers":[{"color":"black"}]},{"featureType":"transit.station.airport","elementType":"geometry.fill","stylers":[{"color":"#cfb2db"}]},{"featureType":"water","elementType":"geometry","stylers":[{"color":"#a2daf2"}]}]
			map.setOptions({styles: map_style})
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

