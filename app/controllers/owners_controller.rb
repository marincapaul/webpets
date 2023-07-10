class OwnersController < ApplicationController
  before_action :logged_in_owner, only:  [:show, :edit, :destroy, :update]
  before_action :correct_owner, only: [:edit, :update]
  
  def index
    @owners = Owner.all
  end

  def show
    @owner = Owner.find(params[:id])
    @pets = @owner.pets
  end

  def edit
    @owner = current_owner
  end

  def edit_profile
    @owner = current_owner
  end

  def update
    @owner = @current_owner
    if @owner.update(owner_params)
      redirect_to @owner
      flash[:notice] = "Your account has been updated!"
    else
      render 'registration/edit'
      flash[:notice] = "Something went wrong when you tried to update your profile, please try again!"
    end
  end

  def update_profile
    @owner = current_owner
    if @owner.update(owner_params)
      redirect_to @owner
      flash[:notice] = "Your profile has been updated!"
    else
      render 'owners/edit_profile'
      flash[:notice] = "Something went wrong when you tried to update your profile, please try again!"
    end
  end
  
  private
  
    def owner_params
      params.require(:owner).permit(:first_name, :last_name, :email, :password, :password_confirmation, :avatar)
    end
end
