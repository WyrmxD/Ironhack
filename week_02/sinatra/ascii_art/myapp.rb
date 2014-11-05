require 'sinatra'
require "sinatra/reloader" if development?
require './library/asciiprinter.rb'

set :bind, '0.0.0.0'

get '/ascii/:word' do 
	word_received = params[:word]
	@ascii_word = Asciiprinter.new().convert_to_ascii(word_received)
	erb :show_ascii_word
end