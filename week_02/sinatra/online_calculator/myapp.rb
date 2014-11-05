require 'sinatra'
require "sinatra/reloader" if development?
require "sinatra/multi_route"
require './library/calculator.rb'

set :bind, '0.0.0.0'


route :get, :post, '/' do
	num1 = params[:num1]
	num2 = params[:num2]
	button = params[:button]
	if !num1.nil? && !num2.nil? 
		calc = Calculator.new()
		case button
		when 'Add'
			@result = calc.add(num1, num2)
		when 'Sub'
			@result = calc.sub(num1, num2)
		when 'Mult'
			@result = calc.mult(num1, num2)
		when 'Div'
			@result = calc.div(num1, num2)
		end
	end
	erb :index
end