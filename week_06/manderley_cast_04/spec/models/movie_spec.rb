require 'spec_helper'

describe Movie do

	it "has a valid factory" do
		expect(build(:movie)).to be_valid
	end

  describe "#title" do

  	before :each do
  		@movie = create :movie, {
  			title: 'La Sirenita',
  			synopsis: 'Un zurullito'
  		}
  	end

  	it "has unique title" do
  		movie2 = build :movie, title: "La Sirenita"
  		@movie.save
  		expect(movie2).not_to be_valid
  	end

  end

end
