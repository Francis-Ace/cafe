# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#To run use -> rails db:seed

# Destroy tables before creating
Product.destroy_all
Category.destroy_all

# Put 3 cetegories of food in the category table
coffee = Category.create(
  name: 'Coffee',
  description: 'A brewed drink prepared from roasted coffee beans,
  the seed of berries from certain Coffea spices.'
)

food = Category.create(
  name: 'Food',
  description: 'appetizing, delectable, delish, divine,
  flavorful, flavorsome, flavory, full-flavored'
)

dessert = Category.create(
  name: 'Dessert',
  description: 'royally luxurious, vaguely sweet, multilayered,
  delicious, delightfully rich, deliciously gooey'
)

# Create the 10 products per categories

# number_of_categories.new(3) ['Coffee', 'Food', 'Dessert']

PRODUCTS_PER_CATEGORIES = 20

# Creates the 10 products under the coffee category
PRODUCTS_PER_CATEGORIES.times do
  product_name = Faker::Coffee.blend_name
  product_description = Faker::Coffee.notes
  product_price = rand(5.5..15.9)
  product_quantity = rand(20..50)
  coffee.products.create(name: product_name,
                         price: product_price,
                         description: product_description,
                         quantity: product_quantity)
end

# Creates the 10 products under the food category
PRODUCTS_PER_CATEGORIES.times do
  product_name2 = Faker::Food.dish
  product_description2 = Faker::Food.description
  product_price2 = rand(5.5..15.9)
  product_quantity2 = rand(20..50)
  food.products.create(name: product_name2,
                       price: product_price2,
                       description: product_description2,
                       quantity: product_quantity2)
end

# Creates the 10 products under the dessert category
PRODUCTS_PER_CATEGORIES.times do
  product_name3 = Faker::Dessert.variety
  product_description3 = Faker::Dessert.flavor
  product_price3 = rand(5.5..15.9)
  product_quantity3 = rand(20..50)
  dessert.products.create(name: product_name3,
                          price: product_price3,
                          description: product_description3,
                          quantity: product_quantity3)
end

puts "Created #{Category.count} Categories"
puts "Created #{Product.count} Products"

# Appointment.destroy_all
# Page.destroy_all
# Player.destroy_all
# Coach.destroy_all
# Team.destroy_all

# NUMBER_OF_TEAMS = 30

# NUMBER_OF_TEAMS.times do
#   team_name = Faker::Sports::Basketball.unique.team
#   team_points = rand(1..100)
#   team = Team.create(name: team_name, points: team_points)

#   number_of_coaches = rand(3..4)
#   number_of_coaches.times do
#     team.coaches.create(name: Faker::Sports::Basketball.coach)
#   end

#   number_of_players = rand(10..15)
#   number_of_players.times do
#     # The created player's team_id(FK) will be assigned the team's PK
#     team.players.create(name: Faker::Sports::Basketball.player)
#   end
# end

# coaches_with_appointments = Coach.random_collection(50)

# coaches_with_appointments.each do |coach|
#   players = Player.random_collection(4)
#   players.each do |player|
#     Appointment.create(coach: coach,
#                       player: player,
#                       appointment_date:Faker::Time.forward(50, period: :morning))
#   end
# end

# Page.create(title: "About", content: "Fill this with content", permalink: "about_us")

# puts "Created #{Team.count} Teams."
# puts "Created #{Coach.count} Coaches"
# puts "Created #{Player.count} Players"
# puts "Created #{Appointment.count} Appointnments"