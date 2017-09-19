# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Pair.destroy_all

admin1 = User.create(email: "admin@pairingstudents.com", password: "12345678", admin: true)

<<<<<<< HEAD
student1 = User.create(email: "student1@pairingstudents.com", password: "12345678", admin: false)
student2 = User.create(email: "student2@pairingstudents.com", password: "12345678", admin: false)
student3 = User.create(email: "student3@pairingstudents.com", password: "12345678", admin: false)
student4 = User.create(email: "student4@pairingstudents.com", password: "12345678", admin: false)
student5 = User.create(email: "student5@pairingstudents.com", password: "12345678", admin: false)
student6 = User.create(email: "student6@pairingstudents.com", password: "12345678", admin: false)
=======
pair1 = Pair.create!()

student1 = User.create!(email: "student1@student.com", password: "123456", admin: false, pair: pair1)
student2 = User.create!(email: "student2@student.com", password: "123456", admin: false, pair: pair1)
student3 = User.create(email: "student3@student.com", password: "123456", admin: false)
student4 = User.create(email: "student4@student.com", password: "123456", admin: false)
student5 = User.create(email: "student5@student.com", password: "123456", admin: false)
>>>>>>> 9be48f03274e14868dc9b5d0a601ab00451cd983
