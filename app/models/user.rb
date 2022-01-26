class User < ApplicationRecord
  has_one :user_detail
  has_many :meetings
  has_many :reservations
end
