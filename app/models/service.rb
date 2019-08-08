class Service < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :bookings
  has_many :reviews, through: :bookings

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  validates :title, :price_per_hour, :location, :description, :category_id, presence: true
  validates :price_per_hour, numericality: { only_integer: true }
  validates :title, uniqueness: { scope: :location }
  # validation uniqueness of the couple title/location must be checked as well
  mount_uploader :photo, PhotoUploader
end
