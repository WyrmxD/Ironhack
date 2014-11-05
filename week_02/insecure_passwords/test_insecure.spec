require './passwordchecker.rb'

RSpec.describe "Insecure Passwords" do

	it "short email stub test" do
		mailer = double("Mailer")
		expect(mailer).to receive(:send_mail)
		checker = Checker.new(mailer)
		checker.check_password(nil)
	end

	it "check pelicula bien formada" do
		imdb_api = double("IMDB es guay")
		expect(imdb_api).to receive(:search)
		ichecker = Imdb_checker.new(imdb_api)
		ichecker.process_film("cadena")
	end
end

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

class Imdb_checker

	def initialize(imdb_api)
		@imdb_api = imdb_api
	end

	def process_film(film_to_search)
		if !film_to_search.empty?
			@imdb_api.search
		end
	end

end