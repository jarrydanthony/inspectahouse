class Booking < ApplicationRecord
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  validates :location, presence: true
  belongs_to :user
  belongs_to :inspection
  has_many_attached :photos
end
