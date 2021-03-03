Rails.application.routes.draw do
  # get 'travel_styles/index'
  # get 'trips_styles/index'
  devise_for :users
  root to: 'pages#home'
  resources :travel_styles, only: [ :index ]
  resources :trips
end
