class File_writer

	def initialize(file_name)
		@file_name = file_name
		check_file
	end

	def check_file
		# TODO: check rigthfully the file
		if File.exists?(@file_name) && File.file?(@file_name) && File.readable?(@file_name) then
			File.delete(@file_name)
		end
	end

	def write(employee)
		File.open(@file_name, 'a') do | f |
			f.write(employee.to_s + "\n")
		end
	end

end