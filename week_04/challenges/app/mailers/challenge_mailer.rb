class ChallengeMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.challenge_mailer.new_support.subject
  #
  def new_support(challenge, supporter)
  	@challenge = challenge
  	@supporter = supporter
  	mail(to: 'ferblape@gmail.com', 
  		subject: "New supporter created in challenge #{challenge.title}")
  end
end
