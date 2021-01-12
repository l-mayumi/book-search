
10.times do |i|
  Book.create(title: Faker::Book.title,
              author_name: Faker::Book.author,
              description: Faker::Quote.famous_last_words,
              image: Faker::Avatar.image(slug: i))
end

# User examples
2.times do |i|
  User.create(email: "admin#{i}@booksearch.net", password: 'abc123')
end