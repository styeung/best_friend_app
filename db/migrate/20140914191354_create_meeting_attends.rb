class CreateMeetingAttends < ActiveRecord::Migration
  def change
    create_table :meeting_attends do |t|
      t.integer :user_id, null: false
      t.integer :meeting_id, null: false
      t.timestamps
    end
    add_index :meeting_attends, :user_id
    add_index :meeting_attends, :meeting_id
  end
end
