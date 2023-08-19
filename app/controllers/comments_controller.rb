class CommentsController < ApplicationController
  
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @post.pet, notice: 'Comment was successfully created.' } # changed the redirect to @post
        format.js
      else 
        format.html { redirect_to @post.pet, notice: 'There was a problem posting your comment.' } # changed the redirect to @post
      end
    end
  end

  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(parent_id: params[:parent_id])
    @pet = @post.pet
    @current_pets = current_owner.pets.map{ |p| [p.name, p.id] } 
  end


  private
  
    def comment_params
      params.require(:comment).permit(:pet_id, :post_id, :body, :parent_id)
    end
end
