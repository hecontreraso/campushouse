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

			for marker in JSON.parse(markers)
				console.log 'marked id ' + marker.id
				inner_marker =new (google.maps.Marker)(
					position: {lat: parseFloat(marker.lat), lng: parseFloat(marker.lon)},
					map: map
				)

				# Changes the background-color of the associated listing on mouseover
				inner_marker.addListener 'mouseover', ((marker_id_copy) ->
					->
						$('#residence-' + marker_id_copy).css("background-color", "rgba(3, 201, 169, 0.11)")
						return
				)(marker.id)
				
				# Restore the background-color of the associated listing on mouseout
				inner_marker.addListener 'mouseout', ((marker_id_copy) ->
					->
						$('#residence-' + marker_id_copy).css("background-color", "#f8f8f8")
						return
				)(marker.id)
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
