class SimpleCommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :username

  def username
  	object.user.username
  end


end
