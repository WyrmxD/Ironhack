require 'sinatra'
require "sinatra/reloader" if development?
require "sinatra/multi_route"

set :bind, '0.0.0.0'


route :get, :post, '/' do
	File.read('geo.html')
end