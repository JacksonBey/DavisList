class CreateListingCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :listing_categories do |t|
      t.string :name
      t.integer :area_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
