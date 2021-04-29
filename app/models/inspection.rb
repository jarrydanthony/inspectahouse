class Inspection < ApplicationRecord

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :comments, dependent: :destroy

  # validations
  validates :location, presence: true
  validates :time, presence: true
  validates :date, presence: true
  validates :payment_amount, presence: true

end
