class KissController < ApplicationController
  def object
  end

  def ajax

  	# sleep 1
  	# comment = Comment.first.attributes
  	# comment["movie"] = Movie.find(comment['movie_id']).attributes.except("created_at", "updated_at")



  	# render json: [Comment.first]*3, root: 'comments'

  	render json: Movie.first
  end

  def echo
  end
end
