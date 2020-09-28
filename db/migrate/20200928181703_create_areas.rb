class CreateAreas < ActiveRecord::Migration[6.0]
  def change
    create_table :areas do |t|
      t.string :name
      t.integer :zip_code

      t.timestamps
    end
  end
end
