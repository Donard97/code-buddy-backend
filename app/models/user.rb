class User < ApplicationRecord
  has_one :user_detail
  has_one :meeting
  has_many :reservations
  validates :user_name, presence: true, uniqueness: true, length: { in: 4..20 }
end
