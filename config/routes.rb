Rails.application.routes.draw do
  
  get 'users/show'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "items#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "items#index"
  resources :items, only:[:new, :show, :create]
  resources :users, only:[:show]
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
end