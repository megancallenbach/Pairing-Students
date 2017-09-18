class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :pair
  has_one :profile

  def has_profile?
    profile.present? && profile.persisted?
  end

  def full_name
    profile.full_name
  end

  def set_admin
    update admin: true
  end
end
