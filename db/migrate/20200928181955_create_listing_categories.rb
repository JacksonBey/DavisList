class CreateListingCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :listing_categories do |t|
      t.string :name
      t.references :area, null: false, foreign_key: true

      t.timestamps
    end
  end
end
