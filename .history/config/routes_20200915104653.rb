Rails.application.routes.draw do  

  root 'sessions#home'


  get '/recipes/most-comments' => 'recipes#most_comments'
  get '/recipes/high-num-ingredients' => 'recipes#high_num_ingredients'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'    
  get '/logout' => 'sessions#destroy'
  delete '/logout' => 'sessions#destroy'
  get '/auth/:provider/callback', to: 'sessions#google'

  
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
     

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
