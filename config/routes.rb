Rails.application.routes.draw do
  devise_for :users
  get 'home/index'

  post 'connection/:buddy_id', to: 'connection#create'

  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
