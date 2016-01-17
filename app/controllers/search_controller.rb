class SearchController < ApplicationController
	MAX_SEARCH_RADIUS = 2.2

	# 1. Obtain the place coordinates (Geocode or get them from DB)
	# 2. Get nearby residences
	# 3. Send coordinates of search point to center map
	# 4. Send coordinates of markers to display them in map
	# 5. Paginar los resultados
	def index
		input = params[:input]
		# params[:min]
		# params[:max]

		search_point = SearchPoint.find_or_create_by(input: input)

		@residences = get_residences(search_point.latitude, search_point.longitude)

		@university = University.find_by(search_term: input)

		@map_latitude = search_point.latitude
		@map_longitude = search_point.longitude
	end

	#Method called when the users drags the map, so new residences are loaded
	def ajax
		lat = params[:lat]
		lng = params[:lng]
		@residences = get_residences(lat, lng)
		render json: @residences
	end

	private

	def get_residences(lat, lng)
		box = Geocoder::Calculations.bounding_box([lat, lng], MAX_SEARCH_RADIUS)
		residences = Residence.within_bounding_box(box).includes(:pictures)
		ActiveModel::SerializableResource.new(residences).to_json
	end

end
