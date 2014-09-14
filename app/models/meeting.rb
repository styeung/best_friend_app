class Meeting < ActiveRecord::Base
  #has_many :attended_users, through: :meeting_users
  belongs_to :creator, class_name: "User", foreign_key: :creator_id
end
