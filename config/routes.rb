Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'pages#home'
  devise_for :owners
  get :test, to: 'pages#test'
  resources :owners


  # Defines the root path route ("/")
  # root "articles#index"
  
  # Defines the root path route ("/")
  # root "articles#index"
end
