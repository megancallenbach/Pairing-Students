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

student1 = User.create!(first_name: Faker::Name.first_name, last_name: "One", email: "student1@student.com", password: "123456", admin: false)
student2 = User.create!(first_name: Faker::Name.first_name, last_name: "Two", email: "student2@student.com", password: "123456", admin: false)
student3 = User.create(first_name: Faker::Name.first_name, last_name: "Three", email: "student3@student.com", password: "123456", admin: false)
student4 = User.create(first_name: Faker::Name.first_name, last_name: "Four", email: "student4@student.com", password: "123456", admin: false)
student5 = User.create(first_name: Faker::Name.first_name, last_name: "Five", email: "student5@student.com", password: "123456", admin: false)
student6 = User.create(first_name: Faker::Name.first_name, last_name: "Six", email: "student6@student.com", password: "123456", admin: false)
student7 = User.create(first_name: Faker::Name.first_name, last_name: "Seven", email: "student7@student.com", password: "123456", admin: false)
student8 = User.create(first_name: Faker::Name.first_name, last_name: "Eight", email: "student8@student.com", password: "123456", admin: false)
student9 = User.create(first_name: Faker::Name.first_name, last_name: "Nine", email: "student9@student.com", password: "123456", admin: false)
student10 = User.create(first_name: Faker::Name.first_name, last_name: "Ten", email: "student10@student.com", password: "123456", admin: false)


pair1 = Pair.create!(student1: student1.first_name, student2: student2.first_name, date: (Date.today - 1))
pair2 = Pair.create!(student1: student1.first_name, student2: student2.first_name, date: (Date.today - 3))
pair3 = Pair.create!(student1: student1.first_name, student2: student2.first_name, date: (Date.today - 7))
