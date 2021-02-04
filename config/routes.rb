Rails.application.routes.draw do



  devise_for :users
  root to: 'pages#home'


  resources :inspections do
    resources :bookings, only: [:new, :index, :create]
  end


  resources :bookings, only: [:show, :edit, :destroy, :update]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
