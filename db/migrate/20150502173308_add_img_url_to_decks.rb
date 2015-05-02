class AddImgUrlToDecks < ActiveRecord::Migration
  def change
    add_column :decks, :img_url, :string
  end
end
