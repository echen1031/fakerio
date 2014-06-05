class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_save   :ensure_authentication_token
  before_create :generate_uuid

  def ensure_authentication_token
    if authentication_token.blank?
      self.authentication_token = generate_authentication_token
    end
  end
 
  private
    
  def generate_uuid
    self.uuid = SecureRandom.hex(52)
  end

  def generate_authentication_token
    token = SecureRandom.hex(52)
  end
end
