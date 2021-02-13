class Inspection < ApplicationRecord
  # validates :description, location presence: true
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :comments, dependent: :destroy
end
