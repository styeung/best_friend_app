class User < ActiveRecord::Base
  validates :username, :email, :password_hash, presence: true
  validates :username, :email, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }
  
  attr_reader :password
  
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
  
  
end
