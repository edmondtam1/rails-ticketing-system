class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  before_action :set_projects, :set_tags, except: [:destroy]
  before_action :require_user, except: [:index, :show]

  def index
    @tickets = if params[:project].present?
                 Project.find_by_id(params[:project]).tickets
               else
                 Ticket.all
               end
    @tickets = @tickets.where(status: params[:status]) if params[:status].present?
    if params[:tag].present?
      @tickets = @tickets.joins(:tags).where("tags.id": params[:tag])
    end
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @project = Project.find(params[:ticket][:project_id])
    @ticket = @project.tickets.build(ticket_params)
    @ticket.creator = current_user

    if @ticket.save
      flash[:notice] = "Your ticket has been created."
      redirect_to tickets_path
    else
      render :new
    end
  end

  def show
    @comment = @ticket.comments.new
  end

  def edit; end

  def update
    if @ticket.update(ticket_params)
      flash[:notice] = "The ticket was updated."
      redirect_to ticket_path(@ticket)
    else
      render :edit
    end
  end

  def destroy
    if @ticket.destroy
      flash[:notice] = "Your ticket has been deleted."
      redirect_to tickets_path
    else
      render ticket_path(@ticket)
    end
  end

  private

  def ticket_params
    params[:status] = params[:status] == "" ? @ticket.status : params[:status]
    params.require(:ticket).permit(:name, :body, :status, :project_id,
                                   :assignee, tag_ids: [])
  end

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def set_tags
    @tags = Tag.all
  end

  def set_projects
    @projects = Project.all
  end
end
