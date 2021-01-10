# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do |i|
  Book.create(title: Faker::Book.title,
              author_name: Faker::Book.author,
              description: Faker::Quote.famous_last_words,
              image: Faker::Avatar.image(slug: i))
end
