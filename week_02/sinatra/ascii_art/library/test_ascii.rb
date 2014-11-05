require './asciiprinter.rb'
require './library/asciiprinter.rb'

RSpec.describe "Ascii Printer" do
    
    let(:printer) { printer = Asciiprinter.new() }

    it "print empty string" do
    	word = ""
    	expect( printer.print(word) ).to eq("")
    end

    it "print one letter" do
    	word = "A"
    	expect( printer.print(word).to eq())
    end
end