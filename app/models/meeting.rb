class Meeting < ApplicationRecord
  belongs_to :user
  belongs_to :meeting_type
  has_many :reservations
end
