# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Pair.destroy_all



admin1 = User.create(first_name: "Mimi", last_name: Faker::Name.last_name, email: "mimi@admin.com", password: "123456", admin: true)
admin2 = User.create(first_name: "Megan", last_name: Faker::Name.last_name, email: "megan@admin.com", password: "123456", admin: true)
pair1 = Pair.create!(student1: admin1, student2: admin2, date: (Date.today - 3))
student1 = User.create!(first_name: Faker::Name.first_name, last_name: "One", email: "student1@student.com", password: "123456", admin: false)
student2 = User.create!(first_name: Faker::Name.first_name, last_name: "Two", email: "student2@student.com", password: "123456", admin: false)
student3 = User.create(first_name: Faker::Name.first_name, last_name: "Three", email: "student3@student.com", password: "123456", admin: false)
student4 = User.create(first_name: Faker::Name.first_name, last_name: "Four", email: "student4@student.com", password: "123456", admin: false)
student5 = User.create(first_name: Faker::Name.first_name, last_name: "Five", email: "student5@student.com", password: "123456", admin: false)
student6 = User.create(first_name: Faker::Name.first_name, last_name: "Six", email: "student6@student.com", password: "123456", admin: false)
