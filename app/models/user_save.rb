class UserSave < ActiveRecord::Base
  validates :creator_id, :saved_user_id, presence: true
  
  belongs_to (
    :creator,
    class_name: "User",
    foreign_key: :creator_id,
    primary_key: :id
  )
  
  belongs_to (
    :saved_user,
    class_name: "User",
    foreign_key: :saved_user_id,
    primary_key: :id
  )
end

