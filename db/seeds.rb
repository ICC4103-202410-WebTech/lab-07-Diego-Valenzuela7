# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Post.delete_all
User.delete_all

user1 = User.create!(
  name: "John Doe",
  email: "john@example.com",
  password: "password"
)

user2 = User.create!(
  name: "Jane Smith",
  email: "jane@example.com",
  password: "password"
)


post1 = user1.posts.create!(
  title: "First post by John",
  content: "This is John's first post. Welcome to my blog!"
)

post2 = user2.posts.create!(
  title: "Hello from Jane",
  content: "Hello everyone! This is my first post here."
)

tag1 = Tag.create!(name: "Technology")
tag2 = Tag.create!(name: "Travel")
tag3 = Tag.create!(name: "Food")
tag4 = Tag.create!(name: "Nature")
tag5 = Tag.create!(name: "Sports")


post1.tags << tag1
post2.tags << tag2
post3.tags << tag3
post4.tags << tag4
post5.tags << tag5

