class SortingList

	def initialize
		@sorting_list = {}
	end

	def add_criteria(criteria)
		@sorting_list[criteria.key] = criteria.process
	end

	def get_criteria(key)
		@sorting_list[key]
	end
	
end