# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def photo_path(i)
  File.join(Rails.root, "test", "fixtures", "photos", "photo#{i}.jpg")
end

def avatar_path(i)
  File.join(Rails.root, "test", "fixtures", "avatars", "avatar#{i}.jpg")
end

def create_photo(user, i)
  photo = Photo.create(
    title: "Photo #{i}",
    description: "Bacon ipsum dolor sit amet beef shoulder frankfurter brisket short loin. Capicola shankle pork belly, turducken chuck doner leberkas short loin. Boudin strip steak pork loin shankle flank spare ribs shoulder. Ball tip leberkas beef shank jerky beef ribs tongue capicola short loin pork belly filet mignon ribeye pork doner.",
    user_id: user.id,
    photo: File.open(photo_path(i))
  )
  if photo.persisted?
    puts "Created photo #{photo.id}"
  end
end

user1 = User.create(
  username: "kayhill",
  first_name: "Kay",
  last_name: "Hill",
  email: "user1@example.com",
  password: "password",
  password_confirmation: "password",
  avatar: File.open(avatar_path(1))
)
(1..4).each do |i|
  create_photo(user1, i)
end

user2 = User.create(
  username: "ritthysimmons",
  first_name: "Ritthy",
  last_name: "Simmmons",
  email: "user2@example.com",
  password: "password",
  password_confirmation: "password",
  avatar: File.open(avatar_path(2))
)
(5..8).each do |i|
  create_photo(user2, i)
end

user3 = User.create(
  username: "williamcook",
  first_name: "William",
  last_name: "Cook",
  email: "user3@example.com",
  password: "password",
  password_confirmation: "password",
  avatar: File.open(avatar_path(3))
)
(9..12).each do |i|
  create_photo(user3, i)
end

user4 = User.create(
  username: "oliviabryant",
  first_name: "Olivia",
  last_name: "Bryant",
  email: "user4@example.com",
  password: "password",
  password_confirmation: "password",
  avatar: File.open(avatar_path(4))
)
(13..16).each do |i|
  create_photo(user4, i)
end