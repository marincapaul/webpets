class SessionsController < ApplicationController

  def create
    pet = Pet.find(params[:pet_id])
    select_pet(pet)
    redirect_to root_path
  end
end
