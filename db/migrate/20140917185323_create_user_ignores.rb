class CreateUserIgnores < ActiveRecord::Migration
  def change
    create_table :user_ignores do |t|
      t.integer :creator_id, null: false
      t.integer :ignored_user_id, null: false
      
      t.timestamps
    end
    
    add_index :user_ignores, :creator_id
    add_index :user_ignores, :ignored_user_id
  end
end
