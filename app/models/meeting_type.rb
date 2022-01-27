class MeetingType < ApplicationRecord
  has_many :meetings
  validates :name, presence: true, uniqueness: true, length: { in: 4..20 }
end
