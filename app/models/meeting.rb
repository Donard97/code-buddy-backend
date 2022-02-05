class Meeting < ApplicationRecord
  belongs_to :user
  belongs_to :meeting_type
  has_many :reservations
  validates :title, presence: true, uniqueness: true, length: { in: 4..20 }
end
