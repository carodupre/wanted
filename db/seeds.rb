require 'faker'

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

Category.create!(category_attributes)

puts 'Creating 20 fake users...'
20.times do
  user = User.new(
    username:    Faker::Name.name,
    password: "password",
    email: Faker::Internet.email,
    phone_number: Faker::PhoneNumber,
  )
  user.save!
end

puts 'Creating 20 fake services...'
20.times do
  service = Service.new(
    title:    Faker::Job.title,
    price_per_hour: rand(10..50),
    location: "#{Faker::Address.street_address}, #{Faker::Address.city}",
    description: Faker::Job.field,
    user: User.all.sample,
    category: Category.all.sample,
    photo: "https://picsum.photos/id/237/200/300"
  )
  service.save!
end

puts 'Creating 20 fake bookings...'
20.times do
  service_i_book = Service.all.sample
  duration = Faker::Number.between(from: 1, to: 2)
  booking = Booking.new(
    address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
    start_time: Faker::Time.forward(days: rand(10..30), period: :morning),
    duration: duration,
    total_price: duration * service_i_book.price_per_hour,
    service: service_i_book,
    user: User.all.sample
    )
  booking.save!
end

puts 'Creating 20 fake reviews...'
20.times do
  review = Review.new(
    description: "I am a Rails developer and now oceanically works on PHP Laravel. In Rails, schema.rb is a file that summarizes the database, which is very convenient for a developer to understand the database schema … , for example, what the data type ",
    title:    Faker::Job.title,
    rating: Faker::Number.between(from: 1, to: 5),
    booking: Booking.all.sample
    )
  review.save!
end
