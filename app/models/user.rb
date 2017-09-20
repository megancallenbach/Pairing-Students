class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :pair, optional: true
  has_one :profile

  def full_name
    "#{first_name} #{last_name}"
  end

  def set_admin
  update admin: true
  end

  
end
