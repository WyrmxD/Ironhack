require './imdbfilter.rb'
require 'imdb'

RSpec.describe "IMDB filter" do

	let(:imdb_filter) { 
		imdb_searcher = 
		# search = Imdb::Search.new("Ruby Sparks")
		# movies = search.movies
		# puts movies.first.title
		# puts movies.first.plot
		Imdbfilter.new() 
	}
	let(:input_string) { "los cojones treinta y tres" }
	let(:filtered_string) { "los co**nes treinta y tres" }

	it "film without bad words" do
		imdb_filter.filter(input_string)
		expect(checker.to_string(number)).to eq(filtered_string)
	end

end