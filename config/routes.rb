Rails.application.routes.draw do
  get 'transaction/new'

  get 'users/show'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "items#index"
  resources :items, only:[:new, :show]
  resources :users, only:[:show]
  resources :transaction, only:[:new]
  resources :credit_cards, only: [:new, :create, :show, :delete]
end