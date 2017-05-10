# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Cleaning database...'
Restaurant.destroy_all
Review.destroy_all

COMMENTS = ["Nice restaurant", "Nice food and lovely staff", "Average food", "So bad and untasty", "Do not go there, this restaurant is not clean and the staff is awful"]

puts 'Creating restaurants...'
restaurants_attributes = [
  {
    name:         "Epicure au Bristol",
    address:      "112 rue du Fg St-Honoré 75008 Paris",
    phone_number: "0123456789",
    category:     "chinese"
  },
  {
    name:         "La truffière",
    address:      "4 rue Blainville 75005 Paris",
    phone_number: "0345678911",
    category:     "italian"
  },
  {
    name:         "Le pré catelan",
    address:      "route de Suresnes 75016 Paris",
    phone_number: "0123456789",
    category:     "french"
  },
  {
    name:         "La table de Sanchez",
    address:      "route de la tablée 75016 Paris",
    phone_number: "0123456789",
    category:     "chinese"
  },
  {
    name:         "La Chaumière",
    address:      "route du vin 75016 Paris",
    phone_number: "+33 0123456789",
    category:     "belgian"
  }
]
Restaurant.create!(restaurants_attributes)
puts 'Finished seeded restaurants!'

puts 'Creating reviews...'
Restaurant.all.each do |restaurant|
  rand(5).times do |i|
    review = restaurant.reviews.new
    review.content = COMMENTS.sample
    review.rating = rand(5)
    review.save!
  end
end
puts 'Finished seeded reviews!'
