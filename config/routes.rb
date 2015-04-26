Rails.application.routes.draw do
  root 'pages#index'

  resources :users, :businesses do
    resources :comments, :reviews, :photos, :hours
  end

  get '/test' => 'pages#test'
  patch '/hours' => 'hours#update'

  get 'businesses/index'

  # Authentication Routes
  get '/signup' => 'users#new'
  post '/signup' => 'users#post'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]

end
