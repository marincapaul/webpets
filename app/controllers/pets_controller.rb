class PetsController < ApplicationController
  before_action :logged_in_owner, only: [:show, :index, :edit, :destroy, :update, 
                                         :following, :followers]
  before_action :owned_pet, only: [:edit, :destroy, :update]\
  
  def index 
  @pets = Pet.all.where.not(owner_id: current_owner.id)
  end

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
    @pagy, @posts = pagy_countless(@pet.posts, items: 8)
    @new_post = Pet.find(params[:id]).posts.build
    @current_pets = current_owner.pets.map{ |p| [p.name, p.id] } 
  end

  def following
    @title = "Following"
    @pet = Pet.find(params[:id])
    @pets = @pet.following
    render "show_follow"
  end
  
  def followers
    @title = "Followers"
    @pet = Pet.find(params[:id])
    @pets = @pet.followers
    render "show_follow"
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
