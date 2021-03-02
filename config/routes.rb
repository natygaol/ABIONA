Rails.application.routes.draw do
  get 'trips_styles/index'
  devise_for :users
  root to: 'pages#home'
  resources :trips do
    resources :trip_styles, only: [ :index, :create]
  end
end
