Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'

  resources :inspections do
    resources :bookings, only: [:index, :create]
    resources :comments, only: [:index, :create]
  end

  resources :comments, only: [:show, :edit,:update, :destroy]

  resources :bookings, only: [:show, :edit, :destroy, :update] do
    member do
      patch :submit
      patch :complete
      patch :accept
      patch :reject
    end
  end

  get '/dashboard', to: 'pages#dashboard'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, only: [:index, :show, :edit, :update]

end
