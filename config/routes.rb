Rails.application.routes.draw do
  devise_for :users
  get 'home/index'

  post 'connection/:buddy_id', to: 'connection#create'
  put 'connection/:buddy_id', to: 'connection#accept'
  delete 'connection/:buddy_id', to: 'connection#decline'

  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
