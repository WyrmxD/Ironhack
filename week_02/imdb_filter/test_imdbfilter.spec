require './imdbfilter.rb'

RSpec.describe "IMDB filter" do

	it "film without bad words" do
		film = instance_double("Film")
		allow(film).to receive(:synopsis).and_return("A film with fukin' wizards")
		expect(film.synopsis).to eq("A film with fukin' wizards")
	end

end