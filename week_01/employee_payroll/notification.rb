class NotificationSMS
	def initialize(number)
		@number = number
	end

	def send
		puts "SMS to #{@number}"
	end
end

class NotificationTwitter
	def initialize(handler)
		@handler = handler
	end

	def send
		puts "Twitt to #{@handler}"
	end
end

class NotificationMail
	def initialize(email)
		@email = email
	end

	def send
		puts "Email to #{@email}"
	end
end