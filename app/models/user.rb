class User < ApplicationRecord
   validates :user_name, presence: true
   validates :password_digest, presence: { message: "You must provide a password."}
   validates :session_token, presence: true, uniqueness: true
   validates :password, allow_nil: true, length: { minimum: 5 }
   
   #after_initialize :ensure_session_token_set

   attr_reader :password

   def self.find_by_credentials(user_name, password)
      # quietly return nil if user and/or password do not match
      user = self.find_by(user_name: user_name)
      return nil unless user
      user.is_password?(password) ? user : nil
   end

   def self.generate_session_token
      SecureRandom::urlsafe_base64(16)
   end
   
   def reset_session_token!
      self.session_token = self.class.generate_session_token
      self.save!
      self.session_token
   end

   def password=(password)
      self.password_digest = BCrypt::Password.create(password)
   end

   def is_password?(password)
      #new generates password object from pre-hashed digest
      BCrypt::Password.new(self.password_digest).is_password?(password)
   end

end
