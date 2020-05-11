Rails.application.routes.draw do
  root      'flights#index'
  resources :flights,   only: [:index]
  post      '/flights', to: 'flights#index'   
  resources :bookings,  only: [:new]
end
