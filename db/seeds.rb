# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user1 = User.create(name: "Alex", email: "altivi.prog@gmail.com", password: "123123", password_confirmation: "123123", avatar: Faker::Avatar.image)
user2 = User.create(name: "User1", email: "user1@gmail.com", password: "123123", password_confirmation: "123123", avatar: Faker::Avatar.image)
user3 = User.create(name: "User2", email: "user2@gmail.com", password: "123123", password_confirmation: "123123", avatar: Faker::Avatar.image)


50.times do |n|
	title = Faker::Lorem.sentence(1)
	Room.create(title: title,
				user_id: user1.id)
end