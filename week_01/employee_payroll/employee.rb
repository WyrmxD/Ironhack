class Employee
	
	def initialize(name, notification)
		@name = name
		@notification = notification
		@salary = 0
	end

	def to_s
		"#{@name} -> #{@salary}"
	end
end

class EmployeeBase < Employee

	attr_reader :salary
	
	def initialize(name, base, notification=nil)
		super(name, notification)
		@base = base.to_i
		@salary = calc_salary
		@notification = notification
	end

	def calc_salary
		@base
	end
end

class EmployeeHour < Employee

	attr_reader :salary
	
	def initialize(name, hour, rate, notification=nil)
		super(name, notification)
		@hour = hour.to_i
		@rate = rate.to_i
		@salary = calc_salary
	end

	def calc_salary
		@hour * @rate
	end
end

class EmployeeBasePlusHour < Employee

	attr_reader :salary
	
	def initialize(name, base, hour, rate, notification=nil)
		super(name, notification)
		@base = base.to_i
		@hour = hour.to_i
		@rate = rate.to_i
		@salary = calc_salary
	end

	def calc_salary
		@base + @hour * @rate
	end
end