class ShowPersonSerializer < ActiveModel::Serializer
	embed :ids
  attributes :id, :first_name, :last_name

  has_many :casts
end
