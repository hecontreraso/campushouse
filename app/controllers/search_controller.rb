class SearchController < ApplicationController
	MAX_SEARCH_RADIUS = 2.2
	MIN_SEARCH_PRICE = 100000
	MAX_SEARCH_PRICE = 2500000
	ITEMS_PER_PAGE = 2500000

	# 1. Obtain the place coordinates (Geocode or get them from DB)
	# 2. Get nearby residences
	# 3. Send coordinates of search point to center map
	# 4. Send coordinates of markers to display them in map
	# 5. Paginar los resultados
	def index
		input = params[:input]
		min_price = params[:min_price]
		max_price = params[:max_price]

		search_point = SearchPoint.find_or_create_by(input: input)

		@residences = get_residences(search_point.latitude, search_point.longitude)

		@university = University.find_by(search_term: input)

		@map_latitude = search_point.latitude
		@map_longitude = search_point.longitude

		@min_search_price = MIN_SEARCH_PRICE
		@max_search_price = MAX_SEARCH_PRICE
		@items_per_page = ITEMS_PER_PAGE
	end

	#Method called when the users drags the map, so new residences are loaded
	def ajax
		@residences = get_residences(
			params[:lat],
			params[:lng],
			params[:min_price],
			params[:max_price]
		)
		render json: @residences
	end

	private

	def get_residences(lat, lng, min_price = MIN_SEARCH_PRICE, max_price = MAX_SEARCH_PRICE)
		box = Geocoder::Calculations.bounding_box([lat, lng], MAX_SEARCH_RADIUS)
		residences = Residence.within_bounding_box(box)
			.where("price >= ? AND price <= ?", min_price, max_price)
			.includes(:pictures)
		ActiveModel::SerializableResource.new(residences).to_json
	end

end
