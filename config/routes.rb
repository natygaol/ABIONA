Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :trips, only: [:new, :create, :edit, :update, :show]
  resources :sample_itineraries, only: [:index]
  # patch 'tripstatus', to: "trips#change_status" 
  get 'confirmation', to: "pages#confirmation"
  get 'inquiries', to: "trips#inquiries"
end
