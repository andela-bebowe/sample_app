class User < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 50, minimum: 3 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 105, minimum: 6 },
                    format: { with: VALID_EMAIL_REGEX }
end
