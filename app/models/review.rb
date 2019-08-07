class Review < ApplicationRecord
  belongs_to :booking
  validates :title, :description, presence: true
end
