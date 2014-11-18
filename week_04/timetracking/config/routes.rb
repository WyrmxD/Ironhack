Rails.application.routes.draw do

	get '/' => 'site#home'
	get '/contact' => 'site#contact'
	get '/projects' => 'projects#index'
	get '/projects/:name' => 'projects#show'
	get '/projects/:project_id/entries' => 'entries#index'
	
end
