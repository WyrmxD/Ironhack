class KissController < ApplicationController
	def object
	end

	def ajax
		render json: Comment.first
	end

	def echo
	end
end
