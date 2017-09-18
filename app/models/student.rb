class Student < ApplicationRecord
  belongs_to :user
  belongs_to :pair
  belongs_to :admin
end
