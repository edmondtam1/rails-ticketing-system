class TagsController < ApplicationController
  before_action :set_tag, only: [:edit, :update, :destroy]

  def index
    @tags = Tag.all
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.create(tag_params)

    if @tag.save
      flash[:notice] = "Your tag has been saved."
      redirect_to tags_path
    else
      render :back
    end
  end

  def edit; end

  def update
    if @tag.update(tag_params)
      flash[:notice] = "Your tag has been updated."
      redirect_to tags_path
    else
      render :back
    end
  end

  def destroy
    if @tag.delete
      flash[:notice] = "Your tag has been deleted."
      redirect_to tags_path
    else
      render :index
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end

  def set_tag
    @tag = Tag.find(params[:id])
  end
end
