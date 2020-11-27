Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
  root to: 'prototypes#index'
  resources :prototypes, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :prototypes do
    resources :comments, only: :create
  end
  resources :users, only: :show
end