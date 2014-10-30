class CalculateDiscount
	def initialize (item_list, table_prices)
		@item_list = item_list
		@table_prices = table_prices
		@discount_list = [
			DiscountApple.new(@table_prices.cost_item(:apples)), 
			DiscountOrange.new(@table_prices.cost_item(:oranges)), 
			DiscountGrapes.new(@table_prices.cost_item(:banana))
		]
	end

	def apply_discounts
		total_discount = 0
		@discount_list.each do |discount|
			total_discount += discount.get_discount(@item_list)
		end
		return total_discount
	end

end

class Discount
	def initialize (discount_amount)
		@discount_amount = discount_amount
	end	
end

class DiscountApple < Discount
	def initialize (discount_amount)
		super(discount_amount)
	end

	def get_discount (item_list)
		same_product_list = item_list.select {|item| item == :apples}
		if same_product_list.count >= 2 
			(same_product_list.count / 2) * @discount_amount
		else
			return 0
		end
	end
end

class DiscountOrange < Discount
	def initialize (discount_amount)
		super(discount_amount)
	end

	def get_discount (item_list)
		same_product_list = item_list.select {|item| item == :oranges}
		if same_product_list.count >= 3 
			(same_product_list.count / 3) * @discount_amount
		else
			return 0
		end
	end
end

class DiscountGrapes < Discount
	def initialize (discount_amount)
		super(discount_amount)
	end

	def get_discount (item_list)
		same_product_list = item_list.select {|item| item == :grapes}
		if same_product_list.count >= 4 
			(same_product_list.count / 4) * @discount_amount
		else
			return 0
		end
	end
end



