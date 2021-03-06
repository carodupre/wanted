# require 'faker'

# category_attributes = [
#    {
#     name: 'actor'
#    },
#    {
#     name: 'model'
#    },
#    {
#     name: 'bodyguard'
#    },
#    {
#     name: 'impersonator'
#    },
#    {
#     name: 'musician'
#    },
#    {
#     name: 'comedian'
#    },
# ]

# Category.create!(category_attributes)

# puts 'Creating 20 fake users...'
# 20.times do
#   user = User.new(
#     username:    Faker::Name.unique.name,
#     password: "password",
#     email: Faker::Internet.email,
#     phone_number: Faker::PhoneNumber,
#   )
#   user.save!
# end

# user = User.new(
#   username: Faker::Internet.username,
#   password: "password",
#   email: Faker::Internet.email,
#   phone_number: Faker::PhoneNumber,
# )
# user.save!

# puts 'Creating 20 fake services...'
# 20.times do
#   service = Service.new(
#     title:    Faker::Job.title,
#     price_per_hour: rand(10..50),
#     location: "#{Faker::Address.street_address}, #{Faker::Address.city}",
#     description: Faker::Job.field,
#     user: User.all.sample,
#     category: Category.all.sample,
#   )
#   # service.remote_photo_url = Faker::LoremPixel.image
#   service.save!
# end

# puts 'Creating 20 fake bookings...'
# 20.times do
#   service_i_book = Service.all.sample
#   duration = Faker::Number.between(from: 1, to: 2)
#   booking = Booking.new(
#     address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
#     start_time: Faker::Time.forward(days: rand(10..30), period: :morning),
#     duration: duration,
#     total_price: duration * service_i_book.price_per_hour,
#     service: service_i_book,
#     user: User.all.sample
#     )
#   booking.save!
# end

# puts 'Creating 20 fake reviews...'
# 50.times do
#   review = Review.new(
#     description: "I am a Rails developer and now oceanically works on PHP Laravel. In Rails, schema.rb is a file that summarizes the database, which is very convenient for a developer to understand the database schema … , for example, what the data type ",
#     title:    Faker::Job.title,
#     rating: Faker::Number.between(from: 1, to: 5),
#     booking: Booking.all.sample
#     )
#   review.save!
# end

####

require 'open-uri'

# puts "Destroy services"
# Service.destroy_all if Rails.env.development?

# puts "Destroy Bookings"
# Booking.destroy_all if Rails.env.development?

# puts "Destroy Users"
# User.destroy_all if Rails.env.development?

# puts "Destroy Reviews"
# Review.destroy_all if Rails.env.development?

# puts "Destroy Categories"
# Category.destroy_all if Rails.env.development?

category_attributes = [
   {
    name: 'actor'
   },
   {
    name: 'model'
   },
   {
    name: 'bodyguard'
   },
   {
    name: 'impersonator'
   },
   {
    name: 'musician'
   },
   {
    name: 'comedian'
   },
]

user_attributes = [
  {
    email: 'martyn@gmail.com',
    username: 'martyn',
    password: 'password',
    phone_number: '404040'
  },

  {
    email: 'caroline@gmail.com',
    username: 'caroline',
    password: 'password',
    phone_number: '404040'
  },

  {
    email: 'austen@gmail.com',
    username: 'austen',
    password: 'password',
    phone_number: '43945'
  },

  {
    email: 'kenny@gmail.com',
    username: 'kenny',
    password: 'password',
    phone_number: '43425'
  }
]

Category.create!(category_attributes)
User.create!(user_attributes)

service_1 = Service.new(
  title: "Cinderella for your kids!",
  price_per_hour: 30,
  location: "Paris",
  description: "I can be Cinderella and entertain your kids",
  user_id: '2',
  category_id: '1'
)
service_1.remote_photo_url = "https://i.pinimg.com/originals/67/85/61/6785610c23253e5a94fc8e2e6ca85ab1.jpg"
service_1.save!

service_2 = Service.new(
  title: "Photo model",
  price_per_hour: 5,
  location: "Canggu",
  description: "I am a professional photo model",
  user_id: '1',
  category_id: '2'
)
service_2.remote_photo_url = "https://i.pinimg.com/736x/e5/6b/79/e56b799b365e63c41041feb38fb7e965--guy-models-men-fashion.jpg"
service_2.save!

booking_attributes = [
  {
    start_time: DateTime.now,
    duration: 5,
    address: '50 rue Matignon, Paris',
    user_id: 4,
    total_price: 150,
    service_id: 1
  },

  {
    start_time: DateTime.now,
    duration: 2,
    address: '3 rue de la Boetie, Paris',
    user_id: 3,
    total_price: 60,
    service_id: 1
  }
]

Booking.create!(booking_attributes)

puts "Finished"

