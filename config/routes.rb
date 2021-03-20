Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'buses#index'

  resources :buses, only: [:index]
  resources :bookings, only: [:new, :create, :show]
end
