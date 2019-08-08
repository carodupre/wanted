Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'user_dashboard', to: 'pages#dashboard', as: 'user_dashboard'

  resources :services do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:show, :edit, :update, :destroy] do
      resources :reviews, only: [:new, :create]
    end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

=begin
                   Prefix Verb   URI Pattern                                                                              Controller#Action
         new_user_session GET    /users/sign_in(.:format)                                                                 devise/sessions#new
             user_session POST   /users/sign_in(.:format)                                                                 devise/sessions#create
     destroy_user_session DELETE /users/sign_out(.:format)                                                                devise/sessions#destroy
        new_user_password GET    /users/password/new(.:format)                                                            devise/passwords#new
       edit_user_password GET    /users/password/edit(.:format)                                                           devise/passwords#edit
            user_password PATCH  /users/password(.:format)                                                                devise/passwords#update
                          PUT    /users/password(.:format)                                                                devise/passwords#update
                          POST   /users/password(.:format)                                                                devise/passwords#create
 cancel_user_registration GET    /users/cancel(.:format)                                                                  devise/registrations#cancel
    new_user_registration GET    /users/sign_up(.:format)                                                                 devise/registrations#new
   edit_user_registration GET    /users/edit(.:format)                                                                    devise/registrations#edit
        user_registration PATCH  /users(.:format)                                                                         devise/registrations#update
                          PUT    /users(.:format)                                                                         devise/registrations#update
                          DELETE /users(.:format)                                                                         devise/registrations#destroy
                          POST   /users(.:format)                                                                         devise/registrations#create
                     root GET    /                                                                                        pages#home
           user_dashboard GET    /user_dashboard(.:format)                                                                pages#dashboard
         service_bookings POST   /services/:service_id/bookings(.:format)                                                 bookings#create
      new_service_booking GET    /services/:service_id/bookings/new(.:format)                                             bookings#new
                 services GET    /services(.:format)                                                                      services#index
                          POST   /services(.:format)                                                                      services#create
              new_service GET    /services/new(.:format)                                                                  services#new
             edit_service GET    /services/:id/edit(.:format)                                                             services#edit
                  service GET    /services/:id(.:format)                                                                  services#show
                          PATCH  /services/:id(.:format)                                                                  services#update
                          PUT    /services/:id(.:format)                                                                  services#update
                          DELETE /services/:id(.:format)                                                                  services#destroy
          booking_reviews POST   /bookings/:booking_id/reviews(.:format)                                                  reviews#create
             edit_booking GET    /bookings/:id/edit(.:format)                                                             bookings#edit
                  booking GET    /bookings/:id(.:format)                                                                  bookings#show
                          PATCH  /bookings/:id(.:format)                                                                  bookings#update
                          PUT    /bookings/:id(.:format)                                                                  bookings#update
       rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
       rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
     rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create
=end
