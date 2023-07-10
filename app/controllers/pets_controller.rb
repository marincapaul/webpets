class PetsController < ApplicationController

  def create
    @pet = current_owner.pets.build(pet_params)
    if @pet.save
      flash[:success] = "Pet created!"
      redirect_to root_url
    else
      flash[:error] = "Error while creating pet!"
      render 'pets/new'
    end
  end

  def new
    @pet = current_owner.pets.build if owner_signed_in?
  end

  def destroy
    @pet.destroy
    flash[:success] = "Pet deleted"
    redirect_to root
  end

  def show
    @pet = Pet.find(params[:id])
  end

  private
    def pet_params
      params.require(:pet).permit(:name, :species, :breed, :age)
    end
end
