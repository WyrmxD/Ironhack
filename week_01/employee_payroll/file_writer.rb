class File_writer

	def initialize(file_name)
		@fd = File.new(file_name, 'w')
	end

end