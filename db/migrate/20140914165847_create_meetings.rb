class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.integer :creator_id, null: false
      t.text :purpose
      t.datetime :start_date_time
      t.datetime :end_date_time
      
      
      t.timestamps
    end
    
    add_index :meetings, :creator_id
    add_index :meetings, :start_date_time
    add_index :meetings, :end_date_time
  end
end
