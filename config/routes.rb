Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }

  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  
  root "items#index"

  get 'transaction/new'

  get 'users/show'
  
  resources :items, only:[:new, :show]
  resources :users, only:[:show]
  resources :transaction, only:[:show] do
    member do
      get 'pay'
      get 'done'
    end
  end
  resources :credit_cards, only: [:new, :create, :show] do
    member do
      delete 'delete'
    end
    collection do
      get 'brandnew'
    end
  end
end