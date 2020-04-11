# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# To run use -> rails db:seed

# Destroy tables before creating
Product.destroy_all
Category.destroy_all

# Put 3 cetegories of food in the category table
coffee = Category.create(
  name:        "Coffee",
  description: 'A brewed drink prepared from roasted coffee beans,
  the seed of berries from certain Coffea spices.'
)

food = Category.create(
  name:        "Food",
  description: 'Appetizing, delectable, delish, divine,
  flavorful, flavorsome, flavory, full-flavored'
)

dessert = Category.create(
  name:        "Dessert",
  description: 'Royally luxurious, vaguely sweet, multilayered,
  delicious, delightfully rich, deliciously gooey'
)

beer = Category.create(
  name:        "Beer",
  description: 'An alcoholic beverage, made from malted cereal grain,
  flavored with hops, and brewed by slow fermentation.'
)

# Create the 10 products per categories

# number_of_categories.new(3) ['Coffee', 'Food', 'Dessert']

products_per_categories = rand(25..30)
# Creates the 10 products under the coffee category
products_per_categories.times do
  product_name = Faker::Coffee.unique.blend_name
  product_description = Faker::Coffee.notes
  product_price = rand(5.5..15.9)
  product_quantity = rand(20..50)
  product = coffee.products.create(name:        product_name,
                                   price:       product_price,
                                   description: product_description,
                                   quantity:    product_quantity)

  downloaded_image = open(URI.escape("https://source.unsplash.com/600x600/?#{[product.name]}"))
  product.image.attach(io: downloaded_image, filename: "m-#{[product.name, product_quantity].join('-')}.jpg")
  sleep(1) # Throttle a tad. Needed?
end

products_per_categories = rand(25..30)
# Creates the 10 products under the food category
products_per_categories.times do
  product_name2 = Faker::Food.unique.dish
  product_description2 = Faker::Food.description
  product_price2 = rand(5.5..15.9)
  product_quantity2 = rand(20..50)
  product2 = food.products.create(name:        product_name2,
                                  price:       product_price2,
                                  description: product_description2,
                                  quantity:    product_quantity2)

  downloaded_image = open(URI.escape("https://source.unsplash.com/600x600/?#{[product2.name]}"))
  product2.image.attach(io: downloaded_image, filename: "m-#{[product2.name, product_quantity2].join('-')}.jpg")
  sleep(1) # Throttle a tad. Needed?
end

products_per_categories = rand(15..20)
# Creates the 10 products under the dessert category
products_per_categories.times do
  product_name3 = Faker::Dessert.unique.variety
  product_description3 = Faker::Dessert.flavor
  product_price3 = rand(5.5..15.9)
  product_quantity3 = rand(20..50)
  product3 = dessert.products.create(name:        product_name3,
                                     price:       product_price3,
                                     description: product_description3,
                                     quantity:    product_quantity3)

  downloaded_image = open(URI.escape("https://source.unsplash.com/600x600/?#{[product3.name]}"))
  product3.image.attach(io: downloaded_image, filename: "m-#{[product3.name, product_quantity3].join('-')}.jpg")
  sleep(1) # Throttle a tad. Needed?
end

products_per_categories = rand(25..30)
# Creates the 10 products under the dessert category
products_per_categories.times do
  product_name4 = Faker::Beer.unique.name
  product_description4 = Faker::Beer.style
  product_price4 = rand(5.5..15.9)
  product_quantity4 = rand(20..50)
  product4 = beer.products.create(name:        product_name4,
                                  price:       product_price4,
                                  description: product_description4,
                                  quantity:    product_quantity4)

  downloaded_image = open(URI.escape("https://source.unsplash.com/600x600/?#{[product4.name]}"))
  product4.image.attach(io: downloaded_image, filename: "m-#{[product4.name, product_quantity4].join('-')}.jpg")
  sleep(1) # Throttle a tad. Needed?
end

puts "Created #{Category.count} Categories"
puts "Created #{Product.count} Products"

if Rails.env.development?
  AdminUser.create!(email: "admin@example.com", password: "password", password_confirmation: "password")
end
