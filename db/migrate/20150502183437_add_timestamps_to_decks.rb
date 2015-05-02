class AddTimestampsToDecks < ActiveRecord::Migration
  def change
    add_column :decks, :created_at, :datetime
    add_column :decks, :updated_at, :datetime
  end
end
