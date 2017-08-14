class CommentsController < ApplicationController
  
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to @tip
    else
      redirect_to @tip
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to request.referer
  end

  private
    def comment_params
      @tip = Tip.find_by(id: params[:comment][:tip_id])
      params.require(:comment).permit(:comment, :user_id, :tip_id)
    end

end
