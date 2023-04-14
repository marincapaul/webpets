class OwnersController < ApplicationController
  def index
    @owners = Owner.all
  end

  def show
    @owner = Owner.find(params[:id])
  end

  private
  
    def owner_params
      params.requre(:owner).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end
