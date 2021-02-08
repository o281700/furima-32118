Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  root to: "items#index"
  resources :items do
    resources :orders, only: [:index, :create]
    resources :comments, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
  resources :categorys, only: [:index, :show]
  resources :users, only: [:show]
end
