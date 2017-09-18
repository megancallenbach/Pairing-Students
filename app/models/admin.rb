class Admin < ApplicationRecord
  belongs_to :user
  has_belongs_to_many :pairs
end
