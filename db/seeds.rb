# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)



user_one = User.create!(email: "test@test.com", password: "123456", username: "testguy")
user_two = User.create!(email: "test1@test.com", password: "123456", username: "testguy1")

#Instruments for user_one
guitar = Instrument.new(available_from: "1889/03/03",name: "guitar", description: "very good", brand: "bosch", city: "London", price: 300 )
piano = Instrument.new(available_from: "1889/03/03",name: "piano", description: "very good", brand: "bosch", city: "London", price: 300 )
trumpette = Instrument.new(available_from: "1889/03/03",name: "trumpette", description: "very good", brand: "bosch", city: "London", price: 300 )
smajd = Instrument.new(available_from: "1889/03/03",name: "smajd", description: "very good", brand: "bosch", city: "London", price: 300 )
portk = Instrument.new(available_from: "1889/03/03",name: "portk", description: "very good", brand: "bosch", city: "London", price: 300 )


guitar.user = user_one
guitar.save!

piano.user = user_one
piano.save!

trumpette.user = user_one
trumpette.save!

smajd.user = user_two
smajd.save!

portk.user = user_two
portk.save!
