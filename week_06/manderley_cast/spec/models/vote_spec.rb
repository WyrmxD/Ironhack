require 'spec_helper'

RSpec.describe Vote, :type => :model do

  it "has a valid factory" do
    expect(build :vote).to be_valid
  end

  it "has a valid liked trait" do
    vote = build :vote, :liked

    expect(vote).to be_liked
  end

  it "has a valid liked trait" do
    vote = build :vote, :disliked

    expect(vote).to be_disliked
  end

  describe ".likes" do

    before :each do
      create_list :vote, 3, :liked
      create_list :vote, 2, :disliked
    end

    it "only returns likes" do
      expect(Vote.likes).to all(be_liked)
    end
  end
end
