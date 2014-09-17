class Meeting < ActiveRecord::Base
  has_many :meeting_attends
  has_many :attended_users, through: :meeting_attends, source: :user
  belongs_to :creator, class_name: "User", foreign_key: :creator_id
  belongs_to :location
end
