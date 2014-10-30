require './file_reader.rb'

class Enterprise

	def initialize(name, output, input)
		@name = name
		@output = output
		@input = input
		@employees = []
	end

	def load_employees

		version = file_version()
		puts "Loading from #{version}"
		if version == :version1 then
			load_employess_v1
		elsif version == :version2 then
			load_employees_v2
		else
			puts "Error file version unknown"		
		end

	end

	def load_employess_v1
		fragmented_lines = @input.get_fragmented_lines
		fragmented_lines.each do | line |

			case line[0]
			when 'Base'
				employee = EmployeeBase.new(line[1], line[2])
			when 'Hour'
				employee = EmployeeHour.new(line[1], line[2], line[3])
			else
				employee = EmployeeBasePlusHour.new(line[1], line[2], line[3], line[4])
			end

			if(!employee.nil?) then
				add_employee(employee)	
			end
		end
	end

	def load_employees_v2
		puts "Cargando con load_employees_v2"
	end

	def file_version
		version = :version2
		
		@input.get_fragmented_lines.each do | line |
			notificator_candidate = line[2]
			if is_email(notificator_candidate) then
			elsif is_twitter(notificator_candidate)
			elsif is_sms(notificator_candidate)				
			else
				version = :version1
			end		
		end

		puts "version file: #{version}"
		return version
	end

	def is_email(string)
		if /\w+@\w+\..{2,3}/.match(string).nil? then
			return false
		end
		return true
	end

	def is_twitter(string)
	end

	def is_sms(string)
	end

	def add_employee(employee)
		@employees.push(employee)
	end

	def write_pay_roll
		@employees.each do | employee |
			@output.write(employee.to_s)
		end
	end

	def send_notifications
	end

	def to_s
		ret = "Enterprise name: #{@name}\n"
		@employees.each do | employee |
			ret << "\t#{employee.to_s}\n"
		end
		ret
	end
end