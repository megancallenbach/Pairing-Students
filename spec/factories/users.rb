
FactoryGirl.define do
  factory :user do
    email     { Faker::Internet.email }
    password  { Faker::Internet.password }
    first_name  "joepie"
    last_name   "Bob"
    admin    false
  end
end
