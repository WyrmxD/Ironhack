class SortingList

	def initialize
		@sorting_list = {}
	end

	def add_criteria(key, process)
		@sorting_list[key] = process
	end

	def get_criteria(key)
		@sorting_list[key]
	end
	
end