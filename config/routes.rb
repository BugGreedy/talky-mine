Rails.application.routes.draw do
  devise_for :users
  root to: 'sounds#index'

  resources :sounds do
    resources :comments, only: :create
    collection do
      get 'search'
    end
    resources :likes, only: [:create, :destroy]
  end
  resources :users
  post '/sounds/new' => 'sounds#create'
   
  # ゲストログイン機能追加時に追記
  post '/sounds/guest_sign_in', to: 'sounds#new_guest'
  
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
end