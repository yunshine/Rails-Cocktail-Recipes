# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'

puts "Destroying all ingredients..."
# Ingredient.destroy_all if Rails.env.development?
Ingredient.destroy_all

puts "Creating ingredients..."
Ingredient.create(name: "Lemon")
Ingredient.create(name: "Lime")
Ingredient.create(name: "Ice")
Ingredient.create(name: "White Rum")
Ingredient.create(name: "Club Soda")
Ingredient.create(name: "Mint Leaves")
Ingredient.create(name: "Ginger Beer")
Ingredient.create(name: "Coconut Cream")
puts "there are eight ingredients now..."

puts "Creating ingredients from JSON..."
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
user_serialized = open(url).read
ingredients = JSON.parse(user_serialized)
ingredients["drinks"].each do |ingredient|
  i = Ingredient.create(name: ingredient["strIngredient1"].titleize)
  puts "create #{i.name}"
end

puts "#{Ingredient.count} ingredients have been created."
