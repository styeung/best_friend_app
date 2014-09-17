class AddAgeColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :age, :integer
    add_index :users, :age
  end
end
