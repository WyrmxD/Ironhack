class CommentSerializer < ActiveModel::Serializer
  embed :ids, include: true
  attributes :id, :body

  has_one :user
  has_one :movie, serializer: MovieShortSerializer
end
