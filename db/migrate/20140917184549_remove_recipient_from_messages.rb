class RemoveRecipientFromMessages < ActiveRecord::Migration
  def change
    remove_column :messages, :recipient_id, :integer
  end
end
