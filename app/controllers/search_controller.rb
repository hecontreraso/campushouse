class SearchController < ApplicationController		
	MAX_SEARCH_RADIUS = 2

	# 1. Obtain the place coordinates (Geocode or get them from DB)
	# 2. Get nearby residences
	# 3. centrar ese punto en el mapa
	# 4. Paginar los resultados
	def index
		search = params[:search]
		# params[:min]
		# params[:max]

		search_point = SearchPoint.find_or_create_by(input: search)
		@residences = Residence.near(
			[search_point.latitude, search_point.longitude],
			MAX_SEARCH_RADIUS,
			:units => :km
		)

	end

end
