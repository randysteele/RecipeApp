Rails.application.routes.draw do  
  
  resources :recipes do
    resources :comments
  end
  resources :recipes do
    resources :ingredients
  end
  resources :ingredients
  resources :recipes
  resources :comments
  resources :users do 
    resources :recipes 
  end  
  resources :users    
  root 'sessions#home'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/logout' => 'sessions#delete'
  delete '/logout' => 'sessions#delete'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'    
  get '/auth/:provider/callback', to: 'sessions#google'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
