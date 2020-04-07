Rails.application.routes.draw do
  resources :recipes
  resources :ingredients
  resources :users
  # get '/signup', to: 'user#new', as: 'signup'

  # get '/recipes/:id', to: 'recipes#show'
  # get '/recipes/new', to: 'recipes#new'
  # get '/recipes/:id/edit', to: 'recipes#edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
