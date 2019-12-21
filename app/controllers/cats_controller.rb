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
end
