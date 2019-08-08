class Service < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
  validates :title, :price_per_hour, :location, :description, :category_id, presence: true
  validates :price_per_hour, numericality: { only_integer: true }
  validates :title, uniqueness: { scope: :location }
  # validates :description, length: { in: 20..100 }
  mount_uploader :photo, PhotoUploader
end
