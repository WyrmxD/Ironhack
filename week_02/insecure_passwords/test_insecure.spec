require './passwordchecker.rb'

RSpec.describe "Insecure Passwords" do

	it "email with nil password" do
		mailer = double("Mailer")
		expect(mailer).to receive(:send_mail)
		checker = Checker.new(mailer)
		checker.check_password(nil)
	end

end