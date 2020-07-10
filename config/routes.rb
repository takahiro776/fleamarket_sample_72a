Rails.application.routes.draw do
  get 'users/show'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "items#index"
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