class Comment < ApplicationRecord
  belongs_to :inspection
  belongs_to :user
end
