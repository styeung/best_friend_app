class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :email, null: false
      t.string :password_hash, null: false
      t.text :life_goals
      t.text :job
      t.text :hobbies
      t.text :reason_to_meet
      t.integer :relationship_status
      t.integer :personality_type
      
      
      t.timestamps
    end
    
    add_index :users, :username, unique: true
    add_index :users, :email, unique: true
  end
end
