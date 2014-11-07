class Comment

	attr_reader :content, :user
	attr_accessor :is_spam

	def initialize(user, content)
		@user = user
		@content = content		
		@is_spam = false
	end
	
end