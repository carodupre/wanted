Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :services do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:show, :edit, :update] do
      resources :reviews, only: [:create]
    end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
