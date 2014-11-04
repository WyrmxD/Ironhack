class Cell
	
	attr_accessor :neighbours
	attr_accessor :status

	def initialize(status)
		@status = status
		@neighbours = 0	
	end
	
	def next_status
		if (@status == :dead && @neighbours == 3) then
			return :alive
		end
		
		if @status == :alive then
			if (@neighbours < 2 || @neighbours > 3) then
				return :dead
			end
		end
	end

	def is_alive
		if @status == :alive then
			return true
		end
		return false
	end

end
