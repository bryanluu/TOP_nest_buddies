Rails.application.routes.draw do
  resources :posts
  post 'posts/:id/like', to: 'posts#like', as: :like_post
  delete 'posts/:id/like', to: 'posts#unlike', as: :unlike_post

  devise_for :users
  get 'home/index'

  post 'connection/:buddy_id', to: 'connection#create', as: 'request_connection'
  put 'connection/:buddy_id', to: 'connection#accept', as: 'accept_request'
  delete 'connection/:buddy_id', to: 'connection#decline', as: 'decline_request'

  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
