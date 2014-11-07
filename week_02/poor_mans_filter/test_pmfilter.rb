require_relative './filter.rb'
require_relative './spamfilter.rb'
require_relative './comment.rb'
require_relative './writer.rb'

RSpec.describe "Poor Man's Spam Filter:" do

	let(:filter) { Filter.new() }
	let(:user_list) { ['Iñaki','Edu','Quino','Rubén'] }
	let(:spfilter) { Spamfilter.new(user_list, filter) }

	it "if correct comment don't mark as spam" do
		empty_comment = instance_double('Comment', :content => "")
		filter_res = spfilter.is_this_spam?(empty_comment.content)
		expect(filter_res).not_to be_truthy
	end

	it "if wrong comment mark as spam" do
		spam_comment = instance_double('Comment', :content => "http:// http://")
		filter_res = spfilter.is_this_spam?(spam_comment.content)
		expect(filter_res).to be_truthy
	end

	it "receive array of comments and mark spam comments" do
		comment = Comment.new("Iñaki", 'contenido')
		comment_list = [comment] * 4
		spam_comment = Comment.new("Fulano",'http:// http://')
		comment_list.push(spam_comment)

		spfilter.mark_spam_list(comment_list)
		expect(comment_list[4].is_spam).to be_truthy

	end

	it "check trusted users comments allowed to write links" do
		comment = Comment.new('Edu', 'http:// http://')
		comment_list = []
		comment_list.push(comment)
		spfilter.mark_spam_list(comment_list)
		expect(comment_list[0].is_spam).not_to be_truthy		
	end

	it "check writes only not spam comments" do
		comment1 = Comment.new('Edu', 'http:// http://')
		comment2 = Comment.new("Fulano", 'http:// http://')
		comment_list = []
		comment_list.push(comment1)
		comment_list.push(comment2)
		spfilter.mark_spam_list(comment_list)
		writer = Writer.new(comment_list, spfilter)
		
		expect(writer.print).to eq("User: Edu -> http:// http://")
	end

end
