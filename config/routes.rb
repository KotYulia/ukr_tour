Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  get 'logout' => 'sessions#destroy'
  get '/auth/facebook/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')

  resources :users
  resources :sessions , except: [:edit, :update] do
    collection do
      get :destroy_admin_user
    end
  end
  resources :tours
  root 'tours#index'
end
