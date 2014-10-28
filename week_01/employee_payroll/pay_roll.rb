require './enterprise.rb'
require './employee.rb'
require './file_reader.rb'
require './file_writer.rb'

f_writer = File_writer.new("output_payroll.txt")
f_reader = File_reader.new("employees_payroll.txt")
fragmented_lines = f_reader.get_fragmented_lines

ikea = Enterprise.new("IKEA", f_writer)

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
		ikea.add_employee(employee)		
	end
end

puts ikea.to_s

ikea.write_pay_roll