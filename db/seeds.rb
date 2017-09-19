# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Pair.destroy_all

pair1 = Pair.create!()

admin1 = User.create(first_name: "admin", last_name: "one", email: "admin@pairingstudents.com", password: "12345678", admin: true, pair: pair1)
admin2 = User.create(first_name: "admin", last_name: "two", email: "admin@admin.com", password: "1234567", admin: true, pair: pair1)

student1 = User.create!(first_name: "student", last_name: "one", email: "student1@student.com", password: "123456", admin: false, pair: pair1)
student2 = User.create!(first_name: "student", last_name: "two", email: "student2@student.com", password: "123456", admin: false, pair: pair1)
student3 = User.create(first_name: "student", last_name: "three", email: "student3@student.com", password: "123456", admin: false)
student4 = User.create(first_name: "student", last_name: "four", email: "student4@student.com", password: "123456", admin: false)
student5 = User.create(first_name: "student", last_name: "five", email: "student5@student.com", password: "123456", admin: false)
