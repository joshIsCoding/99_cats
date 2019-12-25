class SessionsController < ApplicationController
   before_action :already_logged_in, except: :destroy
   def create
      user_credentials = params[:user]
      login_user!(user_credentials)
   end

   def new
      #renders login form for existing users
      @user = User.new
      render :new 
   end

   def destroy
      if current_user
         current_user.reset_session_token!
         session[:session_token] = nil
      end
      redirect_to new_session_url
   end

end