class Prettyprinter


	def print(var_to_print)
		@var_to_print = var_to_print
		
		if is_string || is_integer || is_date then
			return @var_to_print.to_s
		elsif is_hash
			if @var_to_print.size == 1 then
				return "Hash:\n\t#{@var_to_print.keys[0].to_s} --> #{@var_to_print.values[0].to_s}\n"
			else
				last_key = @var_to_print.keys[ @var_to_print.keys.size-1 ]
				last_value = @var_to_print[last_key]
				@var_to_print.delete(last_key)
				output_string = "#{last_key.to_s} --> #{last_value.to_s}\n"
				return self.print(@var_to_print) + "\t" + output_string
			end
		elsif is_array
			
			if @var_to_print.count == 1 then
				return "Array:\n\t" + @var_to_print[0].to_s + "\n"
			else
				element = @var_to_print.pop
				return self.print(@var_to_print) + "\t" + self.print(element) + "\n"
			end

		end
	end

	def is_array
		@var_to_print.class.to_s == 'Array'
	end

	def is_string
		@var_to_print.class.to_s == 'String'
	end
	
	def is_integer
		@var_to_print.class.to_s == 'Fixnum'
	end

	def is_date
		@var_to_print.class.to_s == 'Date'
	end	

	def is_hash
		@var_to_print.class.to_s == 'Hash'
	end
	
end