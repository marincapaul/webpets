class PetsController < ApplicationController
  before_action :logged_in_owner, only: [:show, :edit, :destroy, :update]
  before_action :owned_pet, only: [:edit, :destroy, :update]
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

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    @pet = Pet.find(params[:id])
    if @pet.update(pet_params)
      redirect_to @pet
      flash[:notice] = "Your pet has been updated!"
    else
      render 'pets/edit'
      flash[:notice] = "Something went wrong when you tried to update your pet, please try again!"
    end
  end

  def show
    @pet = Pet.find(params[:id])
  end

  private
    def pet_params
      params.require(:pet).permit(:name, :species, :breed, :age, :avatar)
    end

    def owned_pet
      unless  current_owner.pets.exists?(params[:id])
        flash[:error] = "Restricted page!"
        redirect_to root_url
      end
    end
end
