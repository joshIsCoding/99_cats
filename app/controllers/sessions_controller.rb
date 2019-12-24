class SessionsController < ApplicationController
   def create
      user_credentials = params[:user]
      @user = User.find_by_credentials(user_credentials[:user_name], user_credentials[:password])
      if @user
         #refresh session token for user and database
         session[:session_token] = @user.reset_session_token!
         redirect_to cats_url
      else
         flash.now[:errors] = ["Invalid user credentials."]
         render :new
      end
   end

   def new
      #renders login form for existing users
      @user = User.new
      render :new 
   end
end