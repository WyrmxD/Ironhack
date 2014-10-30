class TablePrices
	def initialize
		@prices_table = {
			:apples => 10, 
			:oranges => 5, 
			:grapes => 15, 
			:banana => 20, 
			:watermelon => 50
		}
	end

	def cost_item(item)
		@prices_table[item]
	end
end