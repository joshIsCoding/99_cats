class CatsController < ApplicationController
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
         redirect_to new_cat_url
      end
   end

   def update
      @cat = Cat.find_by_id(params[:id])
      if @cat.update(cat_params)
         redirect_to cat_url(@cat)
      else
         render :edit
      end
   end

   def create
      @cat = Cat.new(cat_params)
      if @cat.save
         # show new cat page
         redirect_to cat_url(@cat)
      else
         # redirect to new cat form if save fails
         render :new
      end
   end

   private
   
   def cat_params
      params.require(:cat).permit(:name, :birth_date, :color, :sex, :description)
   end

end
