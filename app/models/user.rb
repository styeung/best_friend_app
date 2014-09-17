class User < ActiveRecord::Base
  validates :username, :email, :password_hash, presence: true
  validates :username, :email, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }

  #has_many :saved_users, through: :saved_users
  #has_many :ignored_users, through: :ignored_users
  has_many :conversation_users
  has_many :conversations, through: :conversation_users

  has_many :created_meetings, foreign_key: :creator_id, class_name: "Meeting"

  has_many :meeting_attends
  has_many :attended_meetings, through: :meeting_attends, source: :meeting
  
  has_many :user_photos
  
  has_attached_file :profile_photo, :styles =>  {
    big: "600x600#",
    small: "300x300#"
  }, :default_url => "/images/missing_:style.png"
  
  validates_attachment_content_type(
    :profile_photo, 
    :content_type => /\Aimage\/.*\Z/ 
  )

  attr_reader :password
  after_initialize :ensure_session_token

  def self.find_by_credentials(email, password)
    @user = User.find_by_email(email)

    if @user
      if @user.is_password?(password)
        return @user
      end
    end

    return nil
  end

  def password=(password)
    @password = password
    self.password_hash = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_hash).is_password?(password)
  end

  def self.generate_session_token
    SecureRandom.urlsafe_base64(16)
  end

  def reset_session_token
    self.session_token = self.class.generate_session_token
    self.save!
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end
end
