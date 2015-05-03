class User < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "Email not valid" }
  validates :password, length: { minimum: 7 }
  has_many :decks
  has_many :cards
end
