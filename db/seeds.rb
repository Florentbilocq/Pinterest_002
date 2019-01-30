# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

User.destroy_all
Pin.destroy_all
Comment.destroy_all

#Crée 15 utilisateurs random
15.times do
  user = User.create!(name: Faker::Pokemon.name, password: Faker::Internet.password)
end

#Crée 30 pins random et leur attribue un utilisateur
30.times do
  pin = Pin.create!(url: Faker::Internet.url, user: User.find(rand(1..15)))
end

#Crée 50 commentaires random et leur attribue un utilisateur et un pin
50.times do
  comment = Comment.create!(body: Faker::Markdown.emphasis, user: User.find(rand(1..15)), pin: Pin.find(rand(1..30)))
end
