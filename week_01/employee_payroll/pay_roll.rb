require './enterprise.rb'
require './employee.rb'
require './file_reader.rb'
require './file_writer.rb'

f_writer = File_writer.new("output_payroll.txt")
f_reader = File_reader.new("employees_payroll.txt")

ikea = Enterprise.new("IKEA", f_writer, f_reader)
ikea.load_employees

puts ikea.to_s

ikea.write_pay_roll
# ikea.send_notifications