require_relative './Imdb_trivia'
require_relative './Imdb_adapter'
require_relative './Film'

RSpec.describe "Imdb_trivia" do
		
	let(:movie) {instance_double("Movie", :title => "Batman", :year => 1987, :poster => "http://ia.media-imdb.com/images/M/MV5BMTYxMzA2NTU5MF5BMl5BanBnXkFtZTcwMjI0MDI0Nw@@.jpg")}
	let(:terminators) {
		term_array = [movie] * 7
		term_array.push(instance_double("Movie", :title => "Batman", :year => 1987, :poster => ""))
		term_array.push(instance_double("Movie", :title => "Batman", :year => 1987, :poster => ""))
	}

	let(:imdb_adapter_stub) {instance_double("Imdb_adapter", :get_movies_by_word => [movie])}
	let(:imdb_adapter_stub_movies) {instance_double("Imdb_adapter", :get_movies_by_word => terminators)}

	it "error message when word is empty" do
		expect(Imdb_trivia.new(imdb_adapter_stub).get_movies("")).to eq(nil)
	end

	it "returns movie with any entry" do
		expect(Imdb_trivia.new(imdb_adapter_stub).get_movies("b")).to eq([movie])
		expect(Imdb_trivia.new(imdb_adapter_stub).get_movies("b")[0].title).to eq("Batman")
	end

	it "returns movie poster with any entry" do
		trivia = Imdb_trivia.new(imdb_adapter_stub)
		trivia.get_movies("b")
		expect(trivia.get_posters).to eq([movie.poster])
	end

	it "checks movies with poster" do
		trivia = Imdb_trivia.new(imdb_adapter_stub_movies)
		trivia.get_movies("terminator")
		poster_list = trivia.get_posters
		poster_list.each do|poster|
			expect(poster).not_to be_empty
		end
	end

	it "checks it gets 9 movies with poster" do
		trivia = Imdb_trivia.new(imdb_adapter_stub_movies)
		trivia.get_movies("terminator")
		poster_list = trivia.get_posters
		expect(poster_list.size).to eq(9)
	end

end



=begin
	#test without mocks
	it "returns movie array with any entry" do
		adapter = Imdb_adapter.new
		trivia = Imdb_trivia.new(adapter)
		terminator = Film.new("Terminator 2: El juicio final (1991)", 1991, "http://ia.media-imdb.com/images/M/MV5BMTg5NzUwMDU5NF5BMl5BanBnXkFtZTcwMjk2MDA4Mg@@.jpg")
		expect(trivia.get_movies("Terminator 2: Judgment Day")[0].title).to eq(terminator.title)
	end
=end