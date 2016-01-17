class SearchController < ApplicationController
	MAX_SEARCH_RADIUS = 2.2

	# 1. Obtain the place coordinates (Geocode or get them from DB)
	# 2. Get nearby residences
	# 3. Send coordinates of search point to center map
	# 4. Send coordinates of markers to display them in map
	# 5. Paginar los resultados
	def index
		search = params[:search]
		# params[:min]
		# params[:max]

		search_point = SearchPoint.find_or_create_by(input: search)

		box = Geocoder::Calculations.bounding_box(
			[search_point.latitude, search_point.longitude],
			MAX_SEARCH_RADIUS
		)

		@residences = Residence.within_bounding_box(box).includes(:pictures)
		@residences = ActiveModel::SerializableResource.new(@residences).to_json

		@university = University.find_by(search_term: search)

		@map_latitude = search_point.latitude
		@map_longitude = search_point.longitude

	end

	#Method called when the users drags the map, so new residences are loaded
	def ajax_get_residences
		# map_center
		box = Geocoder::Calculations.bounding_box(
			[map_center.latitude, map_center.longitude],
			MAX_SEARCH_RADIUS
		)
		@residences = Residence.within_bounding_box(box)

		render json: @residences
	end

end
