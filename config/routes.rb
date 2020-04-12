Rails.application.routes.draw do
  resources :add_recipe_id_to_ingredients
  resources :comments
  resources :recipes do
    resources :comments , only: [:new, :create, :index]
  end

  resources :ingredients

  root 'sessions#home'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  delete '/logout' => 'sessions#delete'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  resources :users do 
    resources :recipes, only: [:new, :create, :index]
  end
  

  resources :comments 
  resources :recipes


  
  get '/auth/:provider/callback', to: 'sessions#google'
  



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
