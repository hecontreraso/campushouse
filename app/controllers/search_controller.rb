class SearchController < ApplicationController
	MAX_SEARCH_RADIUS = 2.2
	ITEMS_PER_PAGE = 6


	def index
		input = params[:input]
		min_price = params[:min_price]
		max_price = params[:max_price]

		search_point = SearchPoint.find_or_create_by(input: input)
		@residences = get_residences(search_point.latitude, search_point.longitude)

		@university = University.find_by(search_term: input)

		@map_latitude = search_point.latitude
		@map_longitude = search_point.longitude

		@min_search_price = Residence.minimum(:price)
		@max_search_price = Residence.maximum(:price)
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

	def get_residences(
		lat, lng, min_price = Residence.minimum(:price),
		max_price = Residence.maximum(:price))

		box = Geocoder::Calculations.bounding_box([lat, lng], MAX_SEARCH_RADIUS)
		residences = Residence.within_bounding_box(box)
			.where("price >= ? AND price <= ?", min_price, max_price)
			.includes(:pictures)
		ActiveModel::SerializableResource.new(residences).to_json
	end

end
