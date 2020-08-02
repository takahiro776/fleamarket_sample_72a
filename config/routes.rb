Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }

  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end

  get 'users/show'

  root "items#index"
  resources :items
  resources :users, only:[:show, :edit, :update]
  resources :deals, only:[:show] do
    member do
      get 'pay'
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
  resources :categories, only: [:index]
end