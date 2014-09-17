class UserIgnore < ActiveRecord::Base
  validates :creator_id, :ignored_user_id, presence: true
  
  belongs_to(
    :creator,
    class_name: "User",
    foreign_key: :creator_id,
    primary_key: :id
  )
  
  belongs_to(
    :ignored_user,
    class_name: "User",
    foreign_key: :ignored_user_id,
    primary_key: :id
  )
end
