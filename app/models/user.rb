class User < ApplicationRecord
  has_one :user_detail
  has_one :meeting
  has_many :reservations
end
