Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :trips, only: [:new, :create, :edit, :update, :show] do
    # patch "trips/:id/confirmation", to: "pages#sent_status"
    post 'confirmation', to: "pages#change_sent_status", as: :change_sent_status
    resources :sample_itineraries, only: [:index]
  end
  # patch 'tripstatus', to: "trips#change_status" para cambiar el status a true
  get 'confirmation', to: "pages#confirmation"
  get 'inquiries', to: "trips#inquiries"
  get 'trips/:id/generate', to: "trips#generate_trip_stops", as: :generate
  get 'trips/:id/customize', to: "trips#customize", as: :customize
  post 'trip_stops/:id/increase_nights', to: "trip_stops#increase_nights", as: :increase_nights
  post 'trip_stops/:id/decrease_nights', to: "trip_stops#decrease_nights", as: :decrease_nights
end
