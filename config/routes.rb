Rails.application.routes.draw do
  resources :recipes, only: [:index, :show, :create, :new]
  resources :ingredients, only: [:index, :show, :create, :new]
  resources :users, only: [:index, :show, :create, :new]
  

  get '/recipes/:id', to: 'recipes#show'
  # get '/recipes/new', to: 'recipes#new'
  # get '/recipes/:id/edit', to: 'recipes#edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
