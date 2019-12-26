class UserMailer < ApplicationMailer
   default from: 'everybody@99cats.com'

   def welcome_email(user)
      @user = user
      @login_url = new_session_url
      mail(to: "josh@in-part.co.uk", subject: "Welcome, #{@user.user_name}, to 99Cats!")
   end
end
