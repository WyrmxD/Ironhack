Rails.application.routes.draw do


  get '/' => 'site#index'
  resources :challenges do
    resources :supporters
  end
  
  get '/search' , to: 'search#index' , as: :search_string

end
