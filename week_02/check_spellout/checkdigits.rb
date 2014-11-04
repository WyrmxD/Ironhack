require 'pry'
class Checkdigits

	@@simple_digit = {
		0 => "zero",
		1 => "one",
		2 => "two",
		3 => "three",
		4 => "four",
		5 => "five",
		6 => "six",
		7 => "seven",
		8 => "eight",
		9 => "nine",
	}

	@@tenth_digits = {
		2 => "twenty",
		3 => "thirty",
		4 => "fourty",
		5 => "fifty",
		6 => "sixty",
		7 => "seventy",
		8 => "eighty",
		9 => "ninety",
		10 => "ten",
		11 => "eleven",
		12 => "twelve",
		13 => "thirteen",
		14 => "fourteen",
		15 => "fifteen",
		16 => "sixteen",
		17 => "seventeen",
		18 => "eighteen",
		19 => "nineteen",
	}
	
	def to_string(digit)
		@digit = digit
		@int_part = digit.truncate

		if is_simple then
			number_to_string = build_simple(@int_part)
		elsif is_ten
			number_to_string = build_ten(@int_part)
		elsif is_hundred
			number_to_string = build_hundred(@int_part)
		elsif is_thousand
			number_to_string = build_thousand(@int_part)
		end

		if @digit.class.to_s == 'Float'
			number_to_string << " and #{@digit.to_s.split('.')[1]} cents"
		end
		return "#{@digit} -> " + number_to_string.capitalize
			
	end

	def build_simple(digit)
		"#{@@simple_digit[digit]}"
	end

	def build_ten(digit)
		if digit >= 10 && digit <= 19 then
			"#{@@tenth_digits[digit]}"
		else
			ten, one = get_digit_parts(digit)
			"#{@@tenth_digits[ten]}-#{@@simple_digit[one]}"
		end
	end

	def build_hundred(digit)
		hundred,ten,one = get_digit_parts(digit)
		right_segment = (ten.to_s + one.to_s).to_i
		number_to_string = "#{@@simple_digit[hundred]} hundred"
		if(right_segment != 0) then 
			if right_segment <= 9 then
				number_to_string << " " + build_simple(one)
			else
				number_to_string << " " + build_ten(right_segment)
			end
		end
		number_to_string
	end

	def build_thousand(digit)
		thousand, hundred,ten,one = get_digit_parts(digit)
		right_segment = (hundred.to_s + ten.to_s + one.to_s).to_i
		number_to_string = "#{@@simple_digit[thousand]} thousand"
		if right_segment != 0 then
			if( hundred != 0 )
				number_to_string << " " + build_hundred(hundred)
			end

			if ten != 0 || one != 0 
				number_to_string << " and "
			end

			if ten != 0 
				number_to_string << build_ten(ten)
			end

			if one != 0
				number_to_string << build_simple(one)
			end
		end
		number_to_string
	end

	def get_digit_parts(digit)
		arr = []
		for i in 0..digit.to_s.size-1 do
			arr.push(digit.to_s[i].to_i)
		end
		arr
	end

	def is_simple
		@int_part <= 9
	end

	def is_ten
		@int_part >= 10 && @digit <= 99
	end

	def is_hundred
		@int_part >= 100 && @digit <= 999
	end
	
	def is_thousand
		@int_part >= 1000 && @digit <= 9999
	end

end