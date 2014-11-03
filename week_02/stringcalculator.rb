class StringCalculator

	def add(string_numbers)
		if string_numbers.empty? then 
			return 0
		end

		@separator = get_separator(string_numbers)
		number_list = get_number_list(string_numbers)

		if has_negative_numbers(number_list) then
			raise "negatives not allowed"
		end

		return sum_array(number_list)
		
	end

	def get_number_list(string_numbers)
		if has_separator_at_beggining(string_numbers) then
			number_list = string_numbers[4..-1].split(@separator)
		else
			number_list = string_numbers.split(@separator)
		end
	end

	def get_separator(string_numbers)
		matches = /\/\/(.{1})\n/.match(string_numbers)
		if(matches.nil?) then 
			return ","
		end

		if(matches.captures.count >= 1) then 
			return matches.captures[0]
		end
	end

	def sum_array(number_list)
		number_list.inject(0) { | total_sum, num | total_sum + num.to_i }		
	end

	def has_negative_numbers(number_list)
		number_list.each do | num |
			if num.to_i < 0 then
				return true
			end
		end
		return false
	end

	def has_separator_at_beggining(string_numbers)
		matches = /\/\/.+/.match(string_numbers)
		if(matches.nil?) then 
			return false
		end
		return true
	end

end
