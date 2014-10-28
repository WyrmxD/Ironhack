class File_reader

	def initialize(file_name)
		@fd = File.new(file_name)
	end

	def get_fragmented_lines
		if(@fd.nil?) then
			return
		end

		fragmented_lines = []
		while !@fd.eof? do
			line = @fd.readline
			fragmented_lines.push( process(line) )
		end
		return fragmented_lines
	end

	def process(line)
		line_parts = line.split(' ')
	end

end