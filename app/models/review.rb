class Review < ApplicationRecord
  belongs_to :booking
  validates :title, :description, :rating, presence: true
end
