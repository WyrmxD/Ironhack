class File_writer

	def initialize(file_name)
		@file_name = file_name
	end

	def write(slide)
		puts slide.content
	end

end