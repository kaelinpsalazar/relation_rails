# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
author_1 = Author.find_or_create_by(name: 'Brandon Sanderson', deceased: false, age: 47)
author_2 = Author.find_or_create_by(name: 'Robert Jordan', deceased: false, age: 56)

book_1= Book.create(
  title: 'The Way of Kings',
  genre: 'Fantasy',
  is_published: true,
  publication_year: 2010,
  author: author_1  
)

book_2 = Book.create(
  title: 'The Eye of the World',
  genre: 'Fantasy',
  is_published: true,
  publication_year: 1990,
  author: author_2  
)

