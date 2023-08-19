class RelationshipsController < ApplicationController
  before_action :logged_in_owner

  def create
    @pet = Pet.find(params[:followed_id])
    current_pet = Pet.find(params[:follower_id])
    current_pet.follow(@pet)
    respond_to do |format|
      format.html { redirect_to @pet }
      format.js
    end
  end

  def destroy
    @pet = Relationship.find(params[:id]).followed
    current_pet = Relationship.find(params[:id]).follower
    current_pet.unfollow(@pet)
    respond_to do |format|
      format.html { redirect_to @pet }
      format.js
    end
  end
    
end
