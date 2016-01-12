class SearchController < ApplicationController		
	MAX_SEARCH_RADIUS = 2

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
		@residences = Residence.near(
			[search_point.latitude, search_point.longitude],
			MAX_SEARCH_RADIUS,
			:units => :km
		)
		
		@map_latitude = search_point.latitude
		@map_longitude = search_point.longitude
		
		@markers = []
		@residences.each do |residence|
			@markers << { id: residence.id, lat: residence.latitude, lon: residence.longitude }
		end
	end

end
