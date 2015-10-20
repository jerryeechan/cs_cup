Rails.application.routes.draw do

  get 'sessions/create'

  get 'sessions/destroy'

  #devise_for :users
  resources :posts do
  	resources :comments
  end

post 'users/send_email', to:'users#send_email'
get 'users/close', as:'user_close', to:'users#close'
  resources :users do
    resources :members
  end

  resources :members

  get 'admin/print', to: 'admin#print'
  get 'admin/insurance', to: 'admin#insurance'
  
  get 'register/rule', to: 'register#rule'


  get 'rules', to: 'rules#index'
  get 'rules/basketball', to: 'rules#basketball'
  get 'rules/badminton', to: 'rules#badminton'
  get 'rules/softball', to: 'rules#softball'
  get 'rules/volleyball', to: 'rules#volleyball'
  get 'rules/pingpong', to: 'rules#pingpong'
  get 'rules/overall', to: 'rules#overall'

  get 'info', to: 'info#index'
  get 'info/map' ,to: 'info#map'
  get 'info/food' ,to: 'info#food'
  get 'info/hotel' ,to: 'info#hotel'
  

  get 'schedules' , to: 'schedules#index'

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
