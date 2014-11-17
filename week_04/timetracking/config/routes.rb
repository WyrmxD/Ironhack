Rails.application.routes.draw do

	get '/' => 'site#home'
	get '/contact' => 'site#contact'
	get '/projects' => 'projects#index'
	
end
