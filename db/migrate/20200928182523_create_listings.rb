class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.text :title
      t.text :description
      t.text :price
      t.integer :user_id, null: false, foreign_key: true
      t.integer :listing_category_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
