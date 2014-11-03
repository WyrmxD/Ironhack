require 'test/unit'
require './stringcalculator.rb'

class Test_scalculator < Test::Unit::TestCase

	def test_add
		calculator = StringCalculator.new()
		res = calculator.add("1,2,3")
		assert_equal res, 6
		res = calculator.add("")
		assert_equal res, 0
		res = calculator.add("1")
		assert_equal res, 1
		res = calculator.add("1,2,3,1,1,1")
		assert_equal res, 9

	end

end