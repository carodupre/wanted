class Service < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
  validates :title, :price_per_hour, :location, :description, :category_id, presence: true
  validates :price_per_hour, numericality: { only_integer: true }
  validates :title, uniqueness: { scope: :location }
  # validation uniqueness of the couple title/location must be checked as well
  mount_uploader :photo, PhotoUploader
end
