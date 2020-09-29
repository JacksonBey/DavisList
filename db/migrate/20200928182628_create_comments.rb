class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :user_id, null: false, foreign_key: true
      t.integer :listing_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
