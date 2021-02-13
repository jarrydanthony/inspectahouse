class CommentsController < ApplicationController
  before_action :find_comment, only: [:edit, :update, :destroy]

  def show
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.inspection_id = params[:inspection_id]
    @comment.user = current_user
    if @comment.private #if its a private comment then we want to link the booking
      @booking = Booking.where("inspection_id = :inspection AND status != :rejected", { inspection: @comment.inspection_id, rejected: "Rejected", pending: "Pending" } )[0]
      @comment.booking_id = @booking.id.to_s
    end
    @comment.save
    redirect
  end

  def index
    @comments = @inspection.comments
  end

  def edit
  end

  def update
    @comment.update(comment_params)
    redirect
  end

  def destroy
    @comment.destroy
    redirect
  end

  private 

  def comment_params
    params.require(:comment).permit(:description, :private, :booking_id)
  end

  def find_inspection
    @inspection = Inspection.find(params[:inspection_id])
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end

  def redirect #This method will decide where to redirect to based on whether it is a private comment or not
    if @comment.private
      @bookingarray = Booking.where("inspection_id = :inspection AND status != :rejected", { inspection: @comment.inspection_id, rejected: "Rejected", pending: "Pending" } )
      redirect_to booking_path(@bookingarray[0])
    else
      redirect_to inspection_path(@comment.inspection)
    end
  end
end
