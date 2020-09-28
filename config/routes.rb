Rails.application.routes.draw do
  resources :comments
  resources :listings
  resources :users
  resources :listing_categories
  resources :areas
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
