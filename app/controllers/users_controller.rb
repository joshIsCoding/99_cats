class UsersController < ApplicationController
   def create
      @user = User.new(user_params)
      if @user.save
         # redirect to new session if new user saves correctly
         redirect_to session_url
      else
         flash.now[:errors] = @user.errors.full_messages
         render :new
      end
   end

   def new
      @user = User.new
      render :new
   end
end