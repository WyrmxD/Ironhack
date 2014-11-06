class Imdb_trivia

	def initialize(movie_searcher)
		@movie_searcher = movie_searcher
		@num_movies = 9
	end

	def get_movies(word)

		@word = word

		if word.nil? or word.empty?
			return nil
		end

		@movies = @movie_searcher.get_movies_by_word(word)

	end
	
	def get_posters

		posters = []
		retries=0
		while(posters.size<9 and retries<3)

			@movies.each do |movie|
				if !movie.poster.empty?
					posters.push(movie.poster)
				end
			end

			if(posters.size<9 and retries<3)
				@movie_searcher.get_movies_by_word(word)
			end
			
		end
		
		posters

	end
end