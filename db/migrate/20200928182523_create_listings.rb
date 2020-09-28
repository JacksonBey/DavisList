class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.string :title
      t.text :description
      t.string :price
      t.references :user, null: false, foreign_key: true
      t.references :listing_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
