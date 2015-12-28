# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  initialize = undefined
  initialize = undefined

  initialize = ->
    map = undefined
    mapCanvas = undefined
    mapOptions = undefined
    mapCanvas = document.getElementById('map')
    mapOptions =
      center: new (google.maps.LatLng)(44.5403, -78.5463)
      zoom: 8
      mapTypeId: google.maps.MapTypeId.ROADMAP
      mapTypeControl: false
    map = new (google.maps.Map)(mapCanvas, mapOptions)
    return

  google.maps.event.addDomListener window, 'load', initialize

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