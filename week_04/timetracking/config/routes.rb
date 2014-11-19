Rails.application.routes.draw do

	get '/' => 'site#home'
	get '/contact' => 'site#contact'
	resources :projects do
		resources :entries
	end

	
end
