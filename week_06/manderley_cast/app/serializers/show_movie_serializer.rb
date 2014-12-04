class ShowMovieSerializer < ActiveModel::Serializer
	embed :ids, include: true
	attributes :id, :title, :year, :duration, :synopsis

	has_many :comments
end
