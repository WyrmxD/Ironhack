require './checkdigits.rb'

RSpec.describe "Check Spell out" do

	let(:checker) { Checkdigits.new() }
	
	it "only a digit" do
		number = 1
		expect(checker.to_string(number)).to eq("1 -> One")
		number = 2
		expect(checker.to_string(number)).to eq("2 -> Two")
		number = 0
		expect(checker.to_string(number)).to eq("0 -> Zero")
	end

	it "two digits" do
		number = 10
		expect(checker.to_string(number)).to eq("10 -> Ten")
		number = 13
		expect(checker.to_string(number)).to eq("13 -> Thirteen")
	end

	it "two digits composed" do
		number = 21
		expect(checker.to_string(number)).to eq("21 -> Twenty-one")
		number = 35
		expect(checker.to_string(number)).to eq("35 -> Thirty-five")
		number = 84
		expect(checker.to_string(number)).to eq("84 -> Eighty-four")
		number = 57
		expect(checker.to_string(number)).to eq("57 -> Fifty-seven")
	end

	it "three digits" do
		number = 100
		expect(checker.to_string(number)).to eq("100 -> One hundred")
		number = 200
		expect(checker.to_string(number)).to eq("200 -> Two hundred")
		number = 219
		expect(checker.to_string(number)).to eq("219 -> Two hundred nineteen")
	end

	it "four digits" do
		number = 1000
		expect(checker.to_string(number)).to eq("1000 -> One thousand")
		number = 1001
		expect(checker.to_string(number)).to eq("1001 -> One thousand and one")
		number = 1101
		expect(checker.to_string(number)).to eq("1101 -> One thousand one hundred and one")
		number = 2457
		expect(checker.to_string(number)).to eq("2457 -> Two thousand four hundred and fifty-seven")
	end

	it "one digit one decimal" do
		number = 1.01
		expect(checker.to_string(number)).to eq("1.01 -> One and 01 cents")
	end

end