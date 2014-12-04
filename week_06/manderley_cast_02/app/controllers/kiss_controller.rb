class KissController < ApplicationController
	def object
	end

	def ajax
		render json: Movie.first
	end

	def echo
	end
end
