require './file_reader.rb'

class Enterprise

	def initialize(name, output)
		@name = name
		@output = output
		@employees = []
	end

	def add_employee(employee)
		@employees.push(employee)
	end

	def write_pay_roll
		@employees.each do | employee |
			@output.write(employee.salary)
		end
	end

	def to_s
		ret = "Enterprise name: #{@name}\n"
		@employees.each do | employee |
			ret << "\t#{employee.to_s} , salary: #{employee.calc_salary}\n"
		end
		ret
	end
end