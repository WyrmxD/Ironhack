class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :username
  attribute :movie_title, :key: :movieTitle

  def username
  	object.user.username
  end

  def title
  	object.movie.title
  end


end
