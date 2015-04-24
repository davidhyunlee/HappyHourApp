Rails.application.routes.draw do
  root 'pages#index'

  resources :users, :businesses do
    resources :comments, :reviews, :photos, :hour
  end

  get '/test' => 'pages#test'
  patch '/hours' => 'hours#update'

  get 'businesses/index'

  get '/signup' => 'users#new'
  post '/signup' => 'users#post'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
end
