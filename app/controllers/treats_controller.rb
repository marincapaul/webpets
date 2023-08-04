class TreatsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @treat = @post.treats.new(treat_params)
    respond_to do |format|
      if @treat.save
        format.html { redirect_to @post.pet, notice: 'You gave a treat!' } # changed the redirect to @post
      else 
        format.html { redirect_to @post.pet, notice: 'There was a problem giving treats.' } # changed the redirect to @post
      end
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @treat = @post.treats.find_by(owner_id: current_owner.id)
  
    respond_to do |format|
      if @treat.destroy
        format.html { redirect_to @post.pet, notice: 'Treat was successfully removed.' }
      else
        format.html { redirect_to @post.pet, alert: 'There was a problem removing the treat.' }
      end
    end
  end

  private
  
    def treat_params
      params.require(:treat).permit(:owner_id, :post_id)
    end
end
