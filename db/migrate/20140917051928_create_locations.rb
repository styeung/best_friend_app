class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.decimal :latitude, null: false
      t.decimal :longitude, null: false
      t.string :name
      
      t.timestamps
    end
    
    add_index :locations, :latitude
    add_index :locations, :longitude
    add_index :locations, :name
  end
end
