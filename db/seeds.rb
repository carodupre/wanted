require 'open-uri'

puts "Destroy services"
Service.destroy_all if Rails.env.development?

puts "Destroy Bookings"
Booking.destroy_all if Rails.env.development?

puts "Destroy Users"
User.destroy_all if Rails.env.development?

puts "Destroy Reviews"
Review.destroy_all if Rails.env.development?

puts "Destroy Categories"
Category.destroy_all if Rails.env.development?

category_attributes = [
  {
    name: 'actor'
  },

  {
    name: 'comedian'
  },

  {
    name: 'singer'
  },

  {
    name: 'else'
  }
]
Category.create!(category_attributes)

user_attributes = [
  {
    email: 'kenny@gmail.com',
    username: 'kenny',
    password: 'wantedteamkenny',
    phone_number: '404040'
  },

  {
    email: 'caro@gmail.com',
    username: 'caroline',
    password: 'wantedteamcaro',
    phone_number: '404040'
  },

  {
    email: 'guido@gmail.com',
    username: 'guido',
    password: 'wagonteamguido',
    phone_number: '43945'
  },

  {
    email: 'sonia@gmail.com',
    username: 'sonia',
    password: 'wagonteamsonia',
    phone_number: '43425'
  }
]

User.create!(user_attributes)

services_attributes = [
  {
    title: 'Mickael Jackson Concert',
    price_per_hour: 50,
    location: 'Canggu',
    description: 'Concert with a lot of songs of the King of Pop',
    category_id: '3',
    user_id: '1'
  },

  {
    title: 'Clown for kids',
    price_per_hour: 25,
    location: 'Paris',
    description:'Playing the clown for your kids',
    category_id: '2',
    user_id: '2'
  }
]

Service.create!(services_attributes)

booking_attributes = [
  {
    start_time: DateTime.now,
    duration: 5,
    total_price: 300,
    address: 'Echo Beach Club, Canggu',
    user_id: 3,
    service_id: 1
  },

  {
    start_time: DateTime.now,
    duration: 5,
    total_price: 300,
    address: '3 rue de la Boetie, Paris 15e',
    user_id: 4,
    service_id: 2
  }
]

Booking.create!(booking_attributes)

puts "Finished"
