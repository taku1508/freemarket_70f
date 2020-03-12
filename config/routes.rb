Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
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
      get 'signup'
      get 'users_registration'
    end
  end
  resources :cards, only: [:new, :create, :edit, :update, :destroy] do
    collection do
      post 'delete', to: 'credit_card#delete'
      post 'show'
    end
    member do
      get 'confirmation'
    end
  end 

  resources :addresses, only: [:new, :create]
  resources :categories, only: [:new, :create]
  resources :brands, only: [:new, :create]
  resources :images, only: [:new, :create]
end