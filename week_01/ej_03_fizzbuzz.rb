class FizzBuzz

	def self.printList(last)
		(1..last).each do | i |
			if(i % 3 == 0 && i % 5 == 0) then 
				puts "FizzBuzz"
			elsif(i % 3 == 0) then
				puts "Fizz"
			elsif(i % 5 == 0) then
				puts "Buzz"
			else
				puts i
			end
		end
	end
end

class Fizz

	def initialize(max_value)
		@max_value = max_value
	end

	def count
		(1..@max_value).each do | i |
			if(i % 3 == 0 && i % 5 == 0) then 
				puts "FizzBuzz"
			elsif(i % 3 == 0) then
				puts "Fizz"
			elsif(i % 5 == 0) then
				puts "Buzz"
			else
				puts i
			end
		end
	end

end

FizzBuzz.printList(100)

fizz = Fizz.new(100)
fizz.count