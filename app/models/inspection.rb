class Inspection < ApplicationRecord
  # validates :description, location presence: true
  belongs_to :user
end
