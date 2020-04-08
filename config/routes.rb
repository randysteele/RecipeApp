Rails.application.routes.draw do
  resources :recipes
  resources :ingredients
  resources :users
  root 'sessions#home'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  delete '/logout' => 'sessions#delete'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
