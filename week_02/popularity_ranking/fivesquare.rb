class Fivesquare

	def initialize(sorting_list)
		@pois = []
		@sorting_list = sorting_list
	end
	
	def add_point(point)
		@pois.push(point)
	end

	def sort_by(criteria)
		@sorting_list.get_criteria(criteria).call(@pois)
	end
	
end