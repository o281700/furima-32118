Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :items do
    resources :orders, only: [:index, :create]
    resources :comments, only: [:create]
  end
  resources :categorys, only: [:index, :show]
  resources :users, only: [:show]
end
