class ApplicationController < ActionController::Base
   helper_method :current_user
   def current_user
      User.find_by(session_token: session[:session_token])
   end

   def login_user!(user_params)
      @user = User.find_by_credentials(user_params[:user_name], user_params[:password])
      if @user
         #refresh session token for user and database
         session[:session_token] = @user.reset_session_token!
         redirect_to cats_url
      else
         flash.now[:errors] = ["Invalid user credentials."]
         render "session/new"
      end
   end
end
