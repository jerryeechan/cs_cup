Rails.application.routes.draw do

  get 'sessions/create'

  get 'sessions/destroy'

  #devise_for :users
  resources :posts do
  	resources :comments
  end

  resources :users do
    member do
        get 'send_email'
    end
  end

  resources :talents do
  end

  resources :teams do
    resources :comments
  end

  get 'auth/facebook', as: "auth_provider"
  get 'auth/facebook/callback', to: 'sessions#create'#'users#login'
  #get 'auth/:provider/callback', to: 'sessions#create'
  #get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

resources :sessions, only: [:create, :destroy]

  root "posts#index"

  #get 'people' to: 'people#index'
  get '/about', to: 'pages#about'

end
