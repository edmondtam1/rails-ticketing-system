class ProjectsController < ApplicationController
  before_action :set_project, only: [:edit, :show, :update, :destroy]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      flash[:notice] = "Your project was saved."
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @tickets = @project.tickets
  end

  def edit; end

  def update
    if @project.update(project_params)
      flash[:notice] = "Your project was updated."
      redirect_to project_path(@project)
    else
      render 'edit'
    end
  end

  def destroy
    if @project.destroy
      flash[:notice] = "Your project has been deleted."
      redirect_to projects_path
    else
      render project_path(@project)
    end
  end

  private

  def project_params
    params.require(:project).permit(:name, :description)
  end

  def set_project
    @project = Project.find(params[:id])
  end
end
