Rails.application.routes.draw do
  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  
  root to: 'barbecues#index'


  resources :users, only: [:show] do
    collection do
      resources :messages, only: [:index, :create, :destroy]
      get 'dashboard'
    end
  end
  resources :barbecues do 
    collection do
      get 'search'
    end
    resources :bookings, except: [:show, :index, :destroy]
    resources :reviews, only: :create
  end
  delete '/bookings/:id', to: 'bookings#destroy', as: :delete_booking
  patch '/bookings/:id/accept', to: 'bookings#accept', as: :accept_booking
  
  patch '/messages/:id/read', to: 'messages#read', as: :read_message
  get '/messages/new/:id', to: 'messages#new', as: :new_message
end



