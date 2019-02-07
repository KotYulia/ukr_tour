Rails.application.routes.draw do
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  get 'logout' => 'sessions#destroy'
  get '/auth/facebook/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')

  resources :users
  resources :sessions , except: [:edit, :update]
  resources :tours
  root 'tours#index'
end
