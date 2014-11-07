class Filter
	
	def is_this_spam?(comment)
		comment.scan('http://').size > 1
	end

end