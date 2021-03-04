Rails.application.routes.draw do
  get 'sample_itineraries/index'
  devise_for :users
  root to: 'pages#home'
  resource :trips, only: [:new, :create]
  resources :sample_itineraries, only: [:index]
end
