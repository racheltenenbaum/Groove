# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"

Booking.destroy_all
Instrument.destroy_all
User.destroy_all


user_one = User.create!(email: "test6@test.com", password: "123456", username: "Tim")
user_two = User.create!(email: "test5@test.com", password: "123456", username: "Tina")

#Instruments for user_one
guitar = Instrument.create(available_from: "2023/04/03",name: "guitar", description: "great guitar!", brand: "Fender", city: "London", price: 300, user_id: user_one.id )
flute = Instrument.create(available_from: "2023/10/23",name: "flute", description: "my sister's old flute. Works well.", brand: "Yamaha", city: "Rome", price: 100, user_id: user_two.id )
piano = Instrument.create(available_from: "2023/10/05",name: "piano", description: "very well-tuned piano", brand: "Yamaha", city: "Paris", price: 500, user_id: user_one.id  )
trumpet = Instrument.create(available_from: "2024/11/07",name: "trumpet", description: "my fave trumpet", brand: "Bach", city: "New York", price: 200, user_id: user_one.id  )
drums = Instrument.create(available_from: "2023/08/23",name: "drums", description: "awesome drums", brand: "Ludwig", city: "Sydney", price: 150, user_id: user_two.id )



booking_one = Booking.create(instrument_id: guitar.id, user_id: user_two.id, start_date: "2023/02/02", end_date:"2024/02/02")
booking_two  = Booking.create(instrument_id: drums.id, user_id: user_one.id, start_date: "2023/04/04", end_date:"2023/08/10")
