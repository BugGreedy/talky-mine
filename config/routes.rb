Rails.application.routes.draw do
  devise_for :users
  root to: 'sounds#index'
  resources :sounds

  resources :users
end