class CommentsController < ApplicationController
  before_action :set_ticket, :require_same_user
  before_action :set_comment, only: [:edit, :update]

  def create
    @comment = @ticket.comments.new(body: comment_params[:body])
    @comment.creator = current_user

    if @ticket.update(status: comment_params[:ticket][:status]) &&
       @comment.save
      flash[:notice] = "Your comment has been added."
      redirect_to ticket_path(@ticket)
    else
      render 'tickets/show'
    end
  end

  def edit; end

  def update
    if @ticket.update(status: comment_params[:ticket][:status]) &&
       @comment.update(body: comment_params[:body])
      flash[:notice] = "Your comment has been updated."
      redirect_to ticket_path(@ticket)
    else
      render 'comments/edit'
    end
  end

  private

  def set_comment
    @comment = @ticket.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, ticket: {})
  end

  def set_ticket
    @ticket = Ticket.find(params[:ticket_id])
  end

  def require_same_user
    if current_user != @ticket.creator
      flash[:error] = "You're not allowed to do that."
      redirect_back fallback_location: root_path
    end
  end
end
