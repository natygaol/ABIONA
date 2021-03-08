Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :trips, only: [:new, :create, :edit, :update] do 
    resources :sample_itineraries, only: [:index]  
  end
end
