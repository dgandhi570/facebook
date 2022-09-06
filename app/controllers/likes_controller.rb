class LikesController < ApplicationController

  def new
  end

  def create
      # @post = Post.find(params[:post_id])
      
      @like = current_user.likes.new(like_params)
      
      
        if !@like.save
          flash[:notice] = @like.errors.full_messages.to_sentence
        end
        redirect_to request.referrer
  end



  def destroy
    @like = current_user.likes.find(params[:id])
    post = @like.post
    @like.destroy
    redirect_to request.referrer
  end



  private

  def like_params
    params.require(:like).permit(:post_id)
  end
  
end
