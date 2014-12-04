class MovieSerializer < ActiveModel::Serializer
  embed :ids, include: true
  attributes :id, :title, :year

  has_many :comments, serializer: SimpleCommentSerializer
end
