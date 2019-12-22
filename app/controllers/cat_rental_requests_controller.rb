class CatRentalRequestsController < ApplicationController
   def new
      @cats = Cat.select(:name, :id)
      @new_rental_request = CatRentalRequest.new
      render :new
   end

   def create
      @new_rental_request = CatRentalRequest.new(rental_params)
      if @new_rental_request.save
         redirect_to cat_url(@new_rental_request.desired_cat)
      else
         @cats = Cat.select(:name, :id)
         render :new
      end
   end

   def approve
      @rental_request = CatRentalRequest.find_by_id(params[:id])
      @rental_request.approve!
      redirect_to cat_url(@rental_request.desired_cat)
   end

   def deny
      @rental_request = CatRentalRequest.find_by_id(params[:id])
      @rental_request.deny!
      redirect_to cat_url(@rental_request.desired_cat)
   end

   private
   def rental_params
      params.require(:cat_rental_request).permit(:cat_id, :start_date, :end_date)
   end

end