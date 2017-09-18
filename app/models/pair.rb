class Pair < ApplicationRecord
  has_many :students
  has_and_belongs_to_many :admins
end
