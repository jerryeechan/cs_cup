Rails.application.routes.draw do

  get 'sessions/create'

  get 'sessions/destroy'

  #devise_for :users
  resources :posts do
  	resources :comments
  end

  resources :users do
    resources :members
  end
  resources :members

  


  get 'auth/facebook', as: "user_login"
  get 'auth/facebook/callback', to: 'sessions#create'#'users#login'
  #get 'auth/:provider/callback', to: 'sessions#create'
  #get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

resources :sessions, only: [:create, :destroy]

  root "posts#index"

  #get 'people' to: 'people#index'
  get '/about', to: 'pages#about'

end
