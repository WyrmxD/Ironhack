require 'spec_helper'

describe Movie do

  it "has a valid factory" do
    expect(build(:movie)).to be_valid
  end

  describe "#title" do

    it "is not nil" do
      movie = build :movie, title: nil

      expect(movie).not_to be_valid
    end

    it "is not empty" do
      movie = build :movie, title: ""

      expect(movie).not_to be_valid
    end

    it "is valid with a non-empty title" do
      movie = build :movie, title: "La Sirenita"

      expect(movie).to be_valid
    end

    it "is not duplicated" do
      movie2 = create :movie, title: "La Si", synopsis: "s"

      movie = build :movie, title: "La Si"

      expect(movie).not_to be_valid
    end
  end
end
