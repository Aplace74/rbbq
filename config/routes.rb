Rails.application.routes.draw do
  devise_for :users
  root to: 'barbecues#index'

  resources :users, only: [:show] do
    collection do
      get 'dashboard'
    end
  end
  resources :barbecues do 
    resources :bookings, except: [:show, :index, :destroy]
    resources :reviews, only: [:new, :create]
  end
  delete '/bookings/:id', to: 'bookings#destroy', as: :delete_booking
  patch '/bookings/:id/accept', to: 'bookings#accept', as: :accept_booking
end
