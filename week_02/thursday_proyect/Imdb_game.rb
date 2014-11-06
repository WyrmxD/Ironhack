require 'sinatra'
require "sinatra/reloader" if development?
require 'artii'
require './lib/Imdb_trivia'
require './lib/Imdb_adapter'

set :port, 3000
set :bind, '0.0.0.0'

searcher = Imdb_adapter.new
trivia = Imdb_trivia.new(searcher)


get '/' do
	erb :index
end

post '/sendword' do

	word = params[:word]

	movies = trivia.get_movies(word)
	
	@posters = trivia.get_posters
	
	if movies.nil?
		@err_msg = "No movies"
		erb :err_page
	elsif @posters.size < 9
		@err_msg = "Not enough movies"
		erb :err_page
	end


	erb :start_game

end