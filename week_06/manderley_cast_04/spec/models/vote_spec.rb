require 'spec_helper'

describe Vote do

	describe "testing cositas" do

		it "testing liked method" do
			vote = build :vote, :disliked
			vote.liked
			expect(vote).to be_liked
		end

		it "testing disliked method" do
			vote = build :vote, :liked
			vote.disliked
			expect(vote).to be_disliked
		end

	end
end
