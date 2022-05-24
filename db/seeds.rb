# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Add 10 users with 0-3 instruments

User.delete_all

puts 'All user instances have been deleted'

10.times do
  user = User.create(email: Faker::Internet.email, password: '123456')
  rand(0..3).times do
    instrument = Instrument.new(instrument_type: Faker::Music.instrument, model: Faker::Music.chord, price_per_day: rand(20..100).to_f, location: 'Berlin')
    instrument.user = user
    instrument.save
  end
end

puts '10 users have been created with 0-3 instruments'

10.times do
  booking = Booking.new(start_date: Date.today, end_date: (Date.today + rand(1..7)))
  user = User.all.sample
  booking.user = user
  all_instruments = Instrument.all
  not_owned_instruments = all_instruments - user.instruments
  instrument = not_owned_instruments.sample
  booking.instrument = instrument
  booking.save
end

puts '10 bookings have been created'
