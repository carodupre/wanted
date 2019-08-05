class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :service
  has_one :review
  validates :start_time, :duration, :total_price, :address, presence: true
end
