# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

def random_surface_area
  areas = (25..400).select { |n| (n % 5).zero? }
  areas.sample
end

def random_price
  prices = (20_000..3_000_000).select { |n| (n % 1000).zero? }
  prices.sample
end

puts 'seeding properties...'
20.times do |_i|
  Property.create(name: "#{Faker::Ancient.hero} #{rand(0..5)}", address: Faker::Address.street_address, bed: rand(0..5), bath: rand(1..4),
                  surface_area: random_surface_area, floor: rand(0..20), price: random_price, currency: 'USD', user_id: 1)
end

puts 'Properties seeded!'
