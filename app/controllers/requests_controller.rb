class RequestsController < ApplicationController
  before_action :logged_in_owner

  def create
    @pet = Pet.find(params[:request][:receiver_id])
    @req = Request.new(request_params)
    @req.update(status: 0)
    if @req.save
      flash[:success] = "Request created!"
      redirect_to @pet
    else
      flash[:error] = "Error while creating request!"
      redirect_to @pet
    end
  end
  
  def destroy
    @pet = Request.find(params[:id]).receiver
    current_pet = Request.find(params[:id]).sender
    current_pet.unrequest(@pet)
    respond_to do |format|
      format.html { redirect_to @pet }
      format.js
    end
  end

  def update
    @pet = Pet.find(params[:request][:receiver_id])
    @req = Request.find(params[:id])
    if @req.update(status: 1)
      redirect_to requesters_pet_path(@pet)
    else
      redirect_to requesters_pet_path(@pet)
    end
  end

  
  :private

    def request_params
      params.require(:request).permit(:sender_id, :receiver_id, :description)
    end

end
