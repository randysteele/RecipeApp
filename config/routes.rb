Rails.application.routes.draw do
  resources :ingredients
  resources :users
  resources :recipes
  resources :posts
  get 'recipes', to: 'recipes#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
