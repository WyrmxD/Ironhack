require './prettyprinter.rb'
require 'date'

RSpec.describe "Pretty Printer" do
    
    let(:printer) { printer = Prettyprinter.new() }

    it "print empty string" do
    	var = ""
    	expect( printer.print(var) ).to eq("")
    end

	it "print integer value" do
		var = 100
		expect( printer.print(var) ).to eq("100")
	end

	it "print string" do 
		var = "very long phrase"
		expect( printer.print(var) ).to eq("very long phrase")
	end

	it "print array with 1 integer" do
		var = [100]
		expect( printer.print(var) ).to eq("Array:\n\t100\n")
	end

	it "print array with 2 integer" do
		var = [100, 300]
		output = "Array:\n\t100\n\t300\n"
		expect( printer.print(var) ).to eq(output)
	end

	it "print array with 3 integer" do
		var = [100, 300,600]
		output = "Array:\n\t100\n\t300\n\t600\n"
		expect( printer.print(var) ).to eq(output)
	end

	it "print array with strings integer" do
		var = ["Me", "toca","unpie"]
		output = "Array:\n\tMe\n\ttoca\n\tunpie\n"
		expect( printer.print(var) ).to eq(output)
	end

	it "print a date" do
		var = Date.new(2014, 11, 4)
		output = "2014-11-04"
		expect( printer.print(var) ).to eq(output)
	end

	it "print array with date, integer, string" do
		date = Date.new(2014, 11, 4)
		var = [date, 100, "sleepy"]
		output = "Array:\n\t2014-11-04\n\t100\n\tsleepy\n"
		expect( printer.print(var) ).to eq(output)

		var = [100, "sleepy", date]
		output = "Array:\n\t100\n\tsleepy\n\t2014-11-04\n"
		expect( printer.print(var) ).to eq(output)

		var = [0, "", date]
		output = "Array:\n\t0\n\t\n\t2014-11-04\n"
		expect( printer.print(var) ).to eq(output)

	end

	it "print hash with 1 string" do
		var = {key: "value"}
		output = "Hash:\n\tkey --> value\n"
		expect( printer.print(var) ).to eq(output)
	end

	it "print hash with 2 string" do
		var = {key: "value", key2: "another"}
		output = "Hash:\n\tkey --> value\n\tkey2 --> another\n"
		expect( printer.print(var) ).to eq(output)
	end

	it "print hash with 3 items" do
		var = {key: 100, key2: "another", key3: 300}
		output = "Hash:\n\tkey --> 100\n\tkey2 --> another\n\tkey3 --> 300\n"
		expect( printer.print(var) ).to eq(output)	
	end

	it "print array with array" do
		var = [ [ 200, 300]]
		output = "Array:\n\tArray:\n\t\t200\n\t\t300\n"
		expect( printer.print(var) ).to eq(output)
	end
end