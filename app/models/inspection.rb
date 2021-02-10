class Inspection < ApplicationRecord
  # validates :description, location presence: true
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :comments, dependent: :destroy
end
