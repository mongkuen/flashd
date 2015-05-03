class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.integer :deck_id
      t.integer :user_id
      t.string :heading
      t.text :description
      t.string :img_url
      t.timestamps
    end
  end
end
