Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :trips, only: [:new, :create, :edit, :update, :show] do
  resources :sample_itineraries, only: [:index]
  end
  # patch 'tripstatus', to: "trips#change_status" para cambiar el status a true
  get 'confirmation', to: "pages#confirmation"
  get 'trips/:id/generate', to: "trips#generate_trip_stops", as: :generate
  get 'trips/:id/customize', to: "trips#customize", as: :customize
end
