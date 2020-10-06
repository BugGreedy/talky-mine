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

end