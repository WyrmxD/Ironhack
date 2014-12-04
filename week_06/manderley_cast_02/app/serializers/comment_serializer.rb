class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :username
  attribute :movie_title, key: :title

  def username
  	object.user.username
  end

  def movie_title
  	object.movie.title
  end


end
