class User < ApplicationRecord
  has_one :user_detail
  has_many :meetings
  has_many :reservations
  validates :user_name, presence: true, uniqueness: true, length: { in: 4..20 }
  validates :user_name, format: { without: /\s/, message: 'cannot contain whitespace' }
  before_save :downcase_fields
  def downcase_fields
    user_name.downcase!
  end
end
