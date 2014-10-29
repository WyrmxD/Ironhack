class File_reader

	def initialize(file_name)
		@file_name = file_name
	end

	def get_fragmented_lines
		
		fragmented_lines = []
		File.open(@file_name, 'r') do | f |
			lines = f.readlines()
			lines.each do | line |
				fragmented_lines.push( process(line) )
			end
		end
		return fragmented_lines
	end

	def process(line)
		line_parts = line.split(' ')
	end

end