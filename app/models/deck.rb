class Deck < ActiveRecord::Base
  validates_presence_of :name

  def self.recent_decks
    self.first(30).sort_by(&:created_at).reverse
  end
end
