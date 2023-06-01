# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# Seed data for movies
# Clean db
Movie.destroy_all
List.destroy_all
Bookmark.destroy_all
puts "creating a new db movies"

wonder_woman = Movie.create(title: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)
shawshank_redemption = Movie.create(title: "The Shawshank Redemption", overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison", poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", rating: 8.7)
titanic = Movie.create(title: "Titanic", overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.", poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg", rating: 7.9)
oceans_eight = Movie.create(title: "Ocean's Eight", overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0)

puts "creating a new db list & bookmark..."
# Seed data for lists and associated bookmarks
list1 = List.create(name: "Action Movies")
Bookmark.create(list: list1, movie: wonder_woman, comment: "Exciting action scenes!")
Bookmark.create(list: list1, movie: shawshank_redemption, comment: "A gripping story of hope and friendship.")


list2 = List.create(name: "Romantic Movies")
Bookmark.create(list: list2, movie: titanic, comment: "A timeless love story.")
Bookmark.create(list: list2, movie: oceans_eight, comment: "Romance mixed with heist!")

# You can create more lists and bookmarks as needed

puts "Seed data created successfully!"
