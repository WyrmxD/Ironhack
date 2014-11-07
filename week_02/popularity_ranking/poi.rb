class Poi

	attr_reader :visits
	attr_reader :name, :address
	
	def initialize(name, address)
		@name = name
		@address = address
		@visits = 0
	end
	
	def add_visit(num=1)
		@visits += num
	end
	
end