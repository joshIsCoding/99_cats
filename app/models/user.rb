class User < ApplicationRecord
   validates :user_name, presence: true
   validates :password_digest, presence: { message: "You must provide a password."}
   validates :session_token, presence: true, uniqueness: true
   validates :password, allow_nil: true, length: { minimum: 5 }
   
   #after_initialize :ensure_session_token_set

   


end
