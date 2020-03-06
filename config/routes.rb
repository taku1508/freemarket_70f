Rails.application.routes.draw do
  devise_for :users
  get 'users/index'
  root 'items#index'
  resources :items do
    collection do
      get 'confirm'
    end
  end
  resources :users do
    collection do
      get 'logout'
      get 'deliber_address'
      get 'email_password'
      get 'identify'
    end
  end
  resources :cards, only: [:new, :create, :edit, :update, :destroy]
end