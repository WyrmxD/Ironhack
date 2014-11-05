class Calculator

	def add(num1, num2)
		num1.to_i + num2.to_i
	end
	
	def sub(num1, num2)
		num1.to_i - num2.to_i
	end

	def mult(num1, num2)
		num1.to_i * num2.to_i
	end
	
	def div(num1, num2)
		total = 0
		if(num2.to_i > 0)
			total = num1.to_i / num2.to_i
		end
		total
	end

end