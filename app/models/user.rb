class User < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true
  validates :password, :confirmation => true
  
  attr_reader :password
  attr_accessor :password_confirmation
  
  validate :password_must_be_presente
  
    
  def  User.encrypt_password(password, salt)
    Digest::SHA2.hexdigest(password + "wibble" + salt)
  end
       
  def password=(password)  
    @password = password
    
    if password.present?
      generate_salt
      self.hashed_password = self.class.encrypt_password(password, salt)
    end
  end

 private
    def password_must_be_presente 
      errors.add(:password, "Missing Password" ) unless hashed_password.present?
    end  

    def generate_salt
      self.salt = self.object_id.to_s + rand.to_s
    end
  
end
