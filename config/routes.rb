Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  get 'users/index'
  root 'items#index'
  resources :items do
    member do
      get 'confirm'
    end
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
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
  resources :cards, only: [:new, :create, :edit, :update, :show] do
    collection do
      post 'delete', to: 'cards#delete'
    end
    member do
      get 'confirmation'
      get 'buy'
    end
  end
  resources :addresses, only: [:new, :create]
  resources :categories, only: [:new, :create]
  resources :brands, only: [:new, :create]
  resources :images, only: [:new, :create]
end