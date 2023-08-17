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

  resources :pets, only: [:new ,:show, :index, :create, :destroy, :edit, :update]
  resources :posts, only: [:new ,:show, :create, :destroy, :edit, :update]
  resources :relationships, only: [:create, :destroy]
  resources :pets do
    member do
      get :following, :followers
    end
  end

  resources :posts do
    resources :comments
    resources :treats, only: [:create, :destroy]
  end

  # Defines the root path route ("/")
  # root "articles#index"
  
  # Defines the root path route ("/")
  # root "articles#index"
end
