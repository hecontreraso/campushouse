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
				new (google.maps.Marker)(
					position: {lat: parseFloat(marker.lat), lng: parseFloat(marker.lon)},
					map: map,
					title: 'Hello World!'
				)

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
