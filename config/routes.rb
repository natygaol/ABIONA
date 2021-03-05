Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :trips, only: [:new, :create, :edit, :update] 
  resources :sample_itineraries, only: [:index]
  # patch 'tripstatus', to: "trips#change_status" para cambiar el status a true
  get 'confirmation', to: "pages#confirmation"
end
