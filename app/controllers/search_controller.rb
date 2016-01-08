class SearchController < ApplicationController
	def index
		# pages[:search]
		# pages[:min]
		# pages[:max]

		@residences = Residence.all
	end
end
