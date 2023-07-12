class PostsController < ApplicationController

  def create
  end

  private
    def post_params
      params.require(:pet).permit(:content)
    end

end
