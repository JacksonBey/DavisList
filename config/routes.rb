Rails.application.routes.draw do
  root 'areas#index'
  resources :comments
  resources :listings
  resources :users
  resources :listing_categories
  resources :areas, only: [:index, :show]
  resources :login, only: [:new, :create]

  get '/login', to: 'login#new'
  delete '/logout', to: 'login#destroy', as: 'log_out'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
