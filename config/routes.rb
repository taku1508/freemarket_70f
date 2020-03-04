Rails.application.routes.draw do
  get 'users/index'
  root 'items#index'
  resources :items
  resources :users
end

