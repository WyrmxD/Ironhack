class File_reader

	def initialize(file_name)
		@file_name = file_name
	end

	def get_fragmented_lines
		all_in_one_line = IO.readlines(@file_name).join
		fragmented_lines = process(all_in_one_line, "----\n")
	end

	def process(line, separator)
		line_parts = line.split(separator)
	end

end