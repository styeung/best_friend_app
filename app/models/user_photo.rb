class UserPhoto < ActiveRecord::Base
  validates :user_id, presence: true
  
  belongs_to (
    :user,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id
  )
  
  has_attached_file :photo, :styles =>  {
    big: "600x600#",
    small: "300x300#"
  }
  
  validates_attachment_content_type(
    :photo, 
    :content_type => /\Aimage\/.*\Z/ 
  )
  
end
