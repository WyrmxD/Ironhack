require 'spec_helper'

describe Person do

	it "test the factory" do
		expect(build :person).to be_valid
	end

	it "has first & last names" do
		expect(build :person, first_name: nil).not_to be_valid
		expect(build :person, last_name: nil).not_to be_valid
	end

end
