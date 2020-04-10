Rails.application.routes.draw do
  resources :recipes
  resources :ingredients
  resources :users do 
    resources :recipes
  end
  
  root 'sessions#home'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  delete '/logout' => 'sessions#delete'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
