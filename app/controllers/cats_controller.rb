class CatsController < ApplicationController
   before_action :check_owner, only: [:edit, :update]
   # both edit and update must be protected because malicious users could hijack
   # the update action even without access to the edit form
   
   def index
      @cats = Cat.all
      render :index
   end

   def show
      @cat = Cat.find_by_id(params[:id])
      if @cat
         render :show
      else
         redirect_to cats_url
      end
   end

   def new
      @cat = Cat.new
      render :new
   end

   def edit
      @cat = Cat.find_by_id(params[:id])
      if @cat
         render :edit
      else
         flash[:errors] = @cat.errors.full_messages
         redirect_to new_cat_url
      end
   end

   def update
      @cat = Cat.find_by_id(params[:id])
      if @cat.update(cat_params)
         redirect_to cat_url(@cat)
      else
         flash.now[:errors] = @cat.errors.full_messages
         render :edit
      end
   end

   def create
      @cat = Cat.new(cat_params)
      @cat.owner = current_user
      if @cat.save
         # show new cat page
         redirect_to cat_url(@cat)
      else
         # redirect to new cat form if save fails
         flash.now[:errors] = @cat.errors.full_messages
         render :new
      end
   end

   private
   
   def cat_params
      params.require(:cat).permit(:name, :birth_date, :color, :sex, :description)
   end

   def check_owner
      if current_user.cats.where(id: params[:id]).empty?
         flash[:errors] ||= []
         flash[:errors] << "Sorry, you can't edit this cat"
         redirect_to cat_url(params[:id])
      end
   end
end
