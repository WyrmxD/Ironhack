class File_writer

	def initialize(file_name)
		@fd = File.new(file_name, 'w')
	end

	def write(employee)
		@fd.write(employee.to_s + "\n")
		# TODO: what about closing files
	end

end