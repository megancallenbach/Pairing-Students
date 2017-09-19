# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


admin1 = User.create(email: "admin@pairingstudents.com", password: "12345678", admin: true)

student1 = User.create(email: "student1@pairingstudents.com", password: "12345678", admin: false)
student2 = User.create(email: "student2@pairingstudents.com", password: "12345678", admin: false)
student3 = User.create(email: "student3@pairingstudents.com", password: "12345678", admin: false)
student4 = User.create(email: "student4@pairingstudents.com", password: "12345678", admin: false)
student5 = User.create(email: "student5@pairingstudents.com", password: "12345678", admin: false)
student6 = User.create(email: "student6@pairingstudents.com", password: "12345678", admin: false)
