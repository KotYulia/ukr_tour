Rails.application.routes.draw do
  ActiveAdmin.routes(self) rescue ActiveAdmin::DatabaseHitDuringLoad unless ARGV.grep(/assets:precompile/).any?
  get 'european_tours/index'
  get 'ukrainian_tours/index'
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  get 'logout' => 'sessions#destroy'
  get '/auth/facebook/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')

  resources :contacts, only: [:new, :create]
  get 'contact' => 'contacts#new'

  resources :users
  resources :sessions, except: [:edit, :update] do
    collection do
      get :destroy_admin_user
    end
  end
  resources :european_tours
  resources :ukrainian_tours
  resources :tours
  resources :places
  root 'tours#index'
end
