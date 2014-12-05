class Movie < ActiveRecord::Base

	def to_param
		"#{id}-#{title.parameterize}"
	end
end
