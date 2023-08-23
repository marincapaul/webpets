Rails.application.routes.draw do
  get 'comments/create'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'pages#home'
  devise_for :owners
  get :test, to: 'pages#test'
  resources :owners do
    collection do
      get '/:id/edit_profile' => 'owners#edit_profile', as: :edit_profile
      put '/:id/update_profile' => 'owners#update_profile', as: :update_profile
    end
    
  end

  post "/", to: "pages#home"
  post "select_pet", to: "sessions#create", as: :select_pet

  resources :pets, only: [:new ,:show, :index, :create, :destroy, :edit, :update]
  resources :posts, only: [:new ,:show, :create, :destroy, :edit, :update]
  resources :relationships, only: [:create, :destroy]
  resources :requests, only: [:create, :destroy, :update]
  resources :pets do
    member do
      get :following, :followers
      get :requesting, :requesters
    end
  end

  resources :posts do
    resources :comments
    resources :treats, only: [:create, :destroy]
  end
  
end
