Rails.application.routes.draw do
  
  
  resources :recipes do
    resources :comments
  end
  resources :comments

  resources :recipes do
    resources :ingredients, only: [:new, :create, :index]
  end

  root 'sessions#home'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/logout' => 'sessions#delete'
  delete '/logout' => 'sessions#delete'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  resources :users do 
    resources :recipes, only: [:new, :create, :index]
  end  
  resources :recipes
  resources :ingredients

  
  get '/auth/:provider/callback', to: 'sessions#google'
  



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
