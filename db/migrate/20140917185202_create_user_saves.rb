class CreateUserSaves < ActiveRecord::Migration
  def change
    create_table :user_saves do |t|
      t.integer :creator_id, null: false
      t.integer :saved_user_id, null: false
      t.timestamps
    end
    
    add_index :user_saves, :creator_id
    add_index :user_saves, :saved_user_id
  end
end
