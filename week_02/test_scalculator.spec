require './stringcalculator.rb'

RSpec.describe "String Calculator" do

	let(:calculator) { calculator = StringCalculator.new() }
	
	it "Empty string" do
		expect(calculator.add('')).to eq(0)
	end

	it "One digit" do
		expect(calculator.add("//,\n1")).to eq(1)
		expect(calculator.add("1")).to eq(1)
	end

	it "New line separator" do
		expect(calculator.add("//,\n1,2")).to eq(3)
		expect(calculator.add("1,2")).to eq(3)
	end

	it "Testing several separators" do
		expect(calculator.add("//.\n1.2")).to eq(3)
		expect(calculator.add("//;\n1;2")).to eq(3)
		expect(calculator.add("//|\n1|2")).to eq(3)
		expect(calculator.add("///\n1/2")).to eq(3)
	end

	it "Testing negative numbers" do
		expect{ calculator.add("//.\n1.-2") }.to raise_error
		expect{ calculator.add("1,-2") }.to raise_error
	end


end