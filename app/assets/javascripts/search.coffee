$(document).on 'ready page:load', ->

  if $('.search').length != 0
    initializeMap()
    initializePagination()
    initializePriceSlider()
    window.slider = $("#price").data("ionRangeSlider")

    # // Set style for map
    map_style = [{"featureType":"administrative","elementType":"all","stylers":[{"visibility":"on"},{"lightness":33}]},{"featureType":"landscape","elementType":"all","stylers":[{"color":"#f2e5d4"}]},{"featureType":"poi.park","elementType":"geometry","stylers":[{"color":"#c5dac6"}]},{"featureType":"poi.park","elementType":"labels","stylers":[{"visibility":"on"},{"lightness":20}]},{"featureType":"road","elementType":"all","stylers":[{"lightness":20}]},{"featureType":"road.highway","elementType":"geometry","stylers":[{"color":"#c5c6c6"}]},{"featureType":"road.arterial","elementType":"geometry","stylers":[{"color":"#e4d7c6"}]},{"featureType":"road.local","elementType":"geometry","stylers":[{"color":"#fbfaf7"}]},{"featureType":"water","elementType":"all","stylers":[{"visibility":"on"},{"color":"#acbcc9"}]}]
    map.setOptions({styles: map_style})
    
    map.addListener 'dragend', (e)->
      if map.getZoom() >= 15
        getAndLoadResidences()
      return

    window.markers = []
    loadMarkers(residences)

    $('article.residence')
      .mouseenter ->
        id = $(this).attr('id').split('-')[1]
        for marker in markers
          if marker.get("id").toString() == id
            marker.setIcon(residence_marker_hover_url)
            break
        return
      .mouseleave ->
        id = $(this).attr('id').split('-')[1]
        for marker in markers
          if marker.get("id").toString() == id
            marker.setIcon(residence_marker_url)
            break
        return
      return
    return


# // This method displays the residences in the left panel.
# // Is called on page load (by the 'initializePagination' method),
# // when some pagination button is clicked, and when the map is dragged.
loadLeftPanel = (residences_to_show)->
  $('section.residences').empty()

  for residence in residences_to_show
    residence_html = $('#residence_template').clone()
    residence_html.attr('hidden', false)

    residence_html.attr("id", "residence-" + residence.id)
    actual_class = residence_html.attr("class")
    residence_html.attr("class", actual_class + " residence")
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

  # // Clean residence markers
  i = 0
  while i < markers.length
    markers[i].setMap null
    i++

  for residence in residences_to_show
    marker = new (google.maps.Marker)(
      position: {lat: parseFloat(residence.latitude), lng: parseFloat(residence.longitude)},
      map: map,
      icon: residence_marker_url
    )

    # // Set marker id as same residence id
    ((residence_id, marker_copy) ->
      marker_copy.set("id", residence_id);
      return
    ) residence.id, marker

    # // Changes the background-color of the associated listing on mouseover
    marker.addListener 'mouseover', ((residence_id, marker_copy) ->
      ->
        marker_copy.setIcon(residence_marker_visited_url  )
        $('#residence-' + residence_id).css("background-color", "rgba(77, 201, 3, 0.3)")
        return
    )(residence.id, marker)
    
    # // Restore the background-color of the associated listing on mouseout
    marker.addListener 'mouseout', ((residence_id) ->
      ->
        $('#residence-' + residence_id).css("background-color", "#f8f8f8")
        return
    )(residence.id)

    # // Add to markers array
    markers.push(marker)

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
  $('#price').ionRangeSlider
    type: 'double'
    grid: true
    min: min_search_price
    max: max_search_price
    from: min_search_price
    to: max_search_price
    step: 10000
    prefix: '$'
    onFinish: (data) ->
      getAndLoadResidences()
  return

getAndLoadResidences = ->
  $ .ajax search_ajax_path,
    accepts: 'application/json'
    data:
      lat: map.getCenter().lat()
      lng: map.getCenter().lng()
      min_price: slider.result.from
      max_price: slider.result.to
    success: (data) ->
      loadLeftPanel data
      loadMarkers(data)
      return
    error: (data) ->
      console.log 'Error fetching residences from server'
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
 
 # //Señalar el marcador cambiándolo a un tercer color al hacer hover en la residencia
