class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true
      t.string :address
      t.float :latitude
      t.float :longitude
      t.integer :price
      t.string :currency
      t.float :surface_area
      t.integer :bed
      t.float :bath
      t.integer :floor

      t.timestamps
    end
  end
end
