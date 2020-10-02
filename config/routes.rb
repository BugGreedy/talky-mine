Rails.application.routes.draw do
  devise_for :users
  root to: 'sounds#index'
  resources :sounds do
    resources :comments, only: :create
  end
  resources :users
  post '/sounds/new' => 'sounds#create'

end