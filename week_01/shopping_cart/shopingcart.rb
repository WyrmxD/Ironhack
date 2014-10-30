
require "./tablePrices.rb"
require "./calculateDiscount.rb"

class ShoppingCart
	def initialize
		@table_prices = TablePrices.new
		@item_list = []
		@discount = CalculateDiscount.new(@item_list, @table_prices)
	end

	def add (additem)
		@item_list.push(additem)
		#puts @item_list.to_s
	end

	def total_cost
		cost = 0
		total_discount = @discount.apply_discounts
		@item_list.each do |item|
			cost = cost + @table_prices.cost_item(item)
		end
		puts "Total = #{cost}"
		puts "Total Discount = #{total_discount}"
		puts "Final payment = #{cost - total_discount}"
	end

end



cart = ShoppingCart.new

cart.add :apples
cart.add :apples
cart.add :apples
cart.add :apples
cart.add :banana
cart.add :watermelon

cart.total_cost

