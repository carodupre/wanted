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

=begin
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
