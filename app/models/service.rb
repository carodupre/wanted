class Service < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  validates :title, :price_per_hour, :location, :description, :category_id, presence: true
  validates :price_per_hour, numericality: { only_integer: true }
  validates :title, uniqueness: { scope: :location }
  # validates :description, length: { in: 20..100 }
  mount_uploader :photo, PhotoUploader

  include PgSearch
  pg_search_scope :search_by_title_and_description,
    against: [ :title, :description ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

end
