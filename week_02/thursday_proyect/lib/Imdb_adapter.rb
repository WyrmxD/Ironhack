require 'imdb'
require_relative './Film'

class Imdb_adapter

	def get_movies_by_word(word)
		movie_list = Imdb::Search.new(word).movies
		movie_list_to_show = movie_list.take(15)

		movie_array = movie_list_to_show.map do |movie|
			Film.new(movie.title, movie.year, movie.poster)
			#puts "#{movie.title} , #{movie.year} , #{movie.poster}"
		end
		movie_array
	end
	
end