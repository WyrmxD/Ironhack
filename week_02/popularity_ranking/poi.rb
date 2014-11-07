class Poi

	attr_reader :visits, :name, :address
	
	def initialize(name, address)
		@name = name
		@address = address
		@visits = 0
	end
	
	def add_visit(num=1)
		@visits += num
	end

	def num_comments
		
	end
	
end