class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :avatar, AvatarUploader
  has_many :bookings
  has_many :services, through: :bookings
  validates :username, :phone_number, presence: true
  validates :username, uniqueness: { scope: :phone_number }
end
