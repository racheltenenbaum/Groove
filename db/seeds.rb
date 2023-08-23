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


user_one = User.create!(email: "test6@test.com", password: "123456", username: "testguy")
user_two = User.create!(email: "test5@test.com", password: "123456", username: "testguy1")

#Instruments for user_one
guitar = Instrument.create(available_from: "1889/03/03",name: "guitar", description: "very good", brand: "bosch", city: "London", price: 300, user_id: user_one.id )
piano = Instrument.create(available_from: "1889/03/03",name: "piano", description: "very good", brand: "bosch", city: "London", price: 300, user_id: user_one.id  )
trumpette = Instrument.create(available_from: "1889/03/03",name: "trumpette", description: "very good", brand: "bosch", city: "London", price: 300, user_id: user_one.id  )
smajd = Instrument.create(available_from: "1889/03/03",name: "smajd", description: "very good", brand: "bosch", city: "London", price: 300, user_id: user_two.id )
portk = Instrument.create(available_from: "1889/03/03",name: "portk", description: "very good", brand: "bosch", city: "London", price: 300, user_id: user_two.id )



booking_one = Booking.create(instrument_id: instrument.id, user_id: user.id, start_date: "1990/02/02", end_date:"1991/02/02")
booking_two  = Booking.create(instrument_id: instrument.id, user_id: user.id, start_date: "1992/02/02", end_date:"1993/02/02")
