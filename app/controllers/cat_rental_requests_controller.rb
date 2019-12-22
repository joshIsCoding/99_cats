class CatRentalRequestsController < ApplicationController
   def new
      @cats = Cat.select(:name, :id)
      @new_rental_request = CatRentalRequest.new
      render :new
   end

   def create
      @new_rental_request = CatRentalRequest.new(rental_params)
      @cats = Cat.select(:name, :id)
      if @new_rental_request.save
         redirect_to cat_rental_request_url(@new_rental_request)
      else
         render :new
      end
   end

   def show
   end

   private
   def rental_params
      params.require(:cat_rental_request).permit(:cat_id, :start_date, :end_date)
   end

end