class CatRentalRequestsController < ApplicationController
   before_action :check_user, only: [:approve, :deny]
   
   def new
      @cats = Cat.select(:name, :id)
      @new_rental_request = CatRentalRequest.new
      render :new
   end

   def create
      @new_rental_request = CatRentalRequest.new(rental_params)
      @new_rental_request.requester = current_user
      if @new_rental_request.save
         redirect_to cat_url(@new_rental_request.desired_cat)
      else
         flash.now[:errors] = @new_rental_request.errors.full_messages
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

   def check_user
      desired_cat = CatRentalRequest.find_by_id(params[:id]).desired_cat
      if current_user.cats.where(id: desired_cat.id).empty?
         flash[:errors] ||= []
         flash[:errors] << "You don't have permission to modify this request"
         redirect_to cat_url()
      end
   end

end