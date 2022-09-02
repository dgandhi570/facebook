class LikesController < ApplicationController

    def new
    end

    def create
        @post = Post.find(params[:post_id])
        debugger
        @like = current_user.likes.build(like_params)
        
        respond_to do |format|
          if @like.save
            format.html { redirect_to root_path, notice: "Liked Post" }
          end
          
        end
    end

    private

    def like_params
      params.require(:like).permit(:user_id, :post_id)
    end
    
end
