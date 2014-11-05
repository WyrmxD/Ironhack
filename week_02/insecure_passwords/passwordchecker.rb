class Checker

	def initialize(mailer)
		@mailer = mailer		
	end
	
	def check_password(password)
		if password == nil
			@mailer.send_mail
		end
	end
	
end