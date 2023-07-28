class PostsController < ApplicationController

  def create
    @pet = Pet.find(params[:post][:pet_id])
    @post = @pet.posts.build(post_params)
    @post.media.attach(params[:post][:media])
    if @post.save
      flash[:success] = "Post created!"
      redirect_to @pet
    else
      flash[:error] = "Error while creating the post!"
      render @pet
    end
  end

  private
    def post_params
      params.require(:post).permit(:content, :media, :pet_id)
    end

end
