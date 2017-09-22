class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :pair, optional: true
  has_one :profile

  validates :first_name, presence: true
  validates :last_name, presence: true

public
  def full_name
    "#{first_name} #{last_name}"
  end

  def set_admin
  update admin: true
  end


end
