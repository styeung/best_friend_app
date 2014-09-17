class AddLocationIdToMeeting < ActiveRecord::Migration
  def change
    add_reference :meetings, :location, index: true
  end
end
