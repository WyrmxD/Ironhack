class MovieSerializer < ActiveModel::Serializer
  embed :ids, include: true
  
  attributes :id, :title, :year, :synopsis

  has_many :comments, serializer: CommentShortSerializer
end
