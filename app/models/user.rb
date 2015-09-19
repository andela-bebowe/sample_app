class User < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 50, minimum: 5 }
  validates :email, presence: true, length: { maximum: 105, minimum: 9 }
end
