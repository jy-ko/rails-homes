Rails.application.routes.draw do
  get 'dashboard/index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :properties
  devise_for :users
  get '/dashboard', to: 'dashboard#index', as: 'dashboard'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "home#index"
end
