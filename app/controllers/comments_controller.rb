class CommentsController < ApplicationController
  before_action :find_comment, only: [:edit, :update, :destroy]

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

  def edit
  end

  def update
    @comment.update(comment_params)
    redirect_to inspection_path(@comment.inspection)
  end

  def destroy
    @comment.destroy
    redirect_to inspection_path(@comment.inspection)
  end

  private 

  def comment_params
    params.require(:comment).permit(:description)
  end

  def find_inspection
    @inspection = Inspection.find(params[:inspection_id])
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end
end
