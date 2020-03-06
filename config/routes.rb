Rails.application.routes.draw do
  get 'users/index'
  root 'items#index'
  resources :items do
    collection do
      get 'confirm'
    end
  end
  resources :users
end

