Rails.application.routes.draw do
  devise_for :users
  root to: 'barbecues#index'

  resources :users, only: [:show] do
    collection do
      get 'dashboard'
    end
  end
  resources :barbecues
  resources :bookings, except: [:show, :index]
end
