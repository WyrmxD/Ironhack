class Spamfilter

	def initialize(trusted_users)
		@trusted_users = trusted_users
	end
	
	def is_spam?(comment)
		comment.scan('http://').size > 1
	end

	def mark_spam_list(comment_list)
		comment_list.map do |comment|
			if(!@trusted_users.include?(comment.user))
				comment.is_spam = is_spam?(comment.content)
			end
		end
	end
	
end