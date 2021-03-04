Rails.application.routes.draw do
  # get 'travel_styles/index'
  # get 'trips_styles/index'
  devise_for :users
  root to: 'pages#home'
  resource :trips, only: [:new, :create, :edit, :update] 
end
