class User < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true, uniqueness: true, format: { with: /@/, message: "Email not valid" }
  validates :password, length: { minimum: 7 }
  has_many :decks
  has_many :cards
end
