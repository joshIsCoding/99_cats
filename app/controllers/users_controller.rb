class UsersController < ApplicationController
   before_action :already_logged_in
   def create
      @user = User.new(user_params)
      if @user.save
         # redirect to new session if new user saves correctly
         login_user!(user_params)
      else
         flash.now[:errors] = @user.errors.full_messages
         render :new
      end
   end

   def new
      @user = User.new
      render :new
   end

   private
   def user_params
      params.require(:user).permit(:user_name, :password)
   end
end