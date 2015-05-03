class Card < ActiveRecord::Base
  belongs_to :deck
  belongs_to :user
  validates_presence_of :user, :deck, :title
end
