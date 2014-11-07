class Writer

	def initialize(comment_list, spam_filter)
		@comment_list = comment_list
		@spam_filter = spam_filter
	end
	
	def print
		@spam_filter.mark_spam_list(@comment_list)
		output_string = ""
		@comment_list.each do | comment |
			(!comment.is_spam)? (output_string << "User: #{comment.user} -> #{comment.content}") : ''
		end
		return output_string
	end	
end