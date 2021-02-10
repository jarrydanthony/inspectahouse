class CommentsController < ApplicationController

  def show
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.inspection_id = params[:inspection_id]
    @comment.user = current_user
    @comment.save
    redirect_to inspection_path(@comment.inspection)
  end

  def index
    @comments = @inspection.comments
  end

  private 

  def comment_params
    params.require(:comment).permit(:description)
  end

  def find_inspection
    @inspection = Inspection.find(params[:inspection_id])
  end
end
