class Film

	def initialize(title="", year=0, poster="")
		@title = title
		@year = year
		@poster = poster
	end
	
	attr_reader :title, :year, :poster

end