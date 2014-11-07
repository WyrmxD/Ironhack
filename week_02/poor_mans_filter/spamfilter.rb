class Spamfilter

	def initialize(trusted_users, filter)
		@trusted_users = trusted_users
		@filter = filter
	end

	def is_this_spam?(comment)
		@filter.is_this_spam?(comment)
	end


	def mark_spam_list(comment_list)
		comment_list.map do |comment|
			if(!@trusted_users.include?(comment.user))
				comment.is_spam = @filter.is_this_spam?(comment.content)
			end
		end
	end
	
end