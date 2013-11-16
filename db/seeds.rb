# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

rand(10..30).times do
  w = Wiki.create(subject: Faker::Lorem.words(rand(1..10)).join(" "), description: Faker::Lorem.paragraphs(rand(1..4)).join("\n"))
  rand(3..10).times do
    w.articles.create(title: Faker::Lorem.words(rand(1..10)).join(" "),body: Faker::Lorem.paragraphs(rand(1..2)).join("\n"))
  end
end

puts "Seed finished"
puts "#{Wiki.count} wikis created"
puts "#{Article.count} articles created"