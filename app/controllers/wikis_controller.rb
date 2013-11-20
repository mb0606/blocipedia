class WikisController < ApplicationController
  def index
    @wikis = Wiki.all
  end

  def new
    @wiki = Wiki.new
    authorize @wiki
  end

  def show
    @wiki = Wiki.find(params[:id])
    @wiki.articles 
    authorize @wiki   
  end

  def edit
    @wiki = Wiki.find(params[:id])
    authorize @wiki
  end

  def create
    @wiki = current_user.wikis.build(params[:wiki])
    authorize @wiki
    if @wiki.save
      flash[:notice] = "Wiki was saved successfully."
      redirect_to @wiki
    else
      flash[:error] = "Error creating wiki. Please try again."
      render :new
    end
  end

  def update
    @wiki = Wiki.find(params[:id])
    authorize @wiki
    if @wiki.update_attributes(params[:wiki])
      flash[:notice] = "Wiki was updated"
      redirect_to @wiki
    else
      flash[:error] = "Error saving wiki. Please try again"
      render :edit
    end
  end

  def destroy
    @wiki = Wiki.find(params[:id])
    subject = @wiki.subject
    authorize @wiki
    if @wiki.destroy
      flash[:notice] = "\"#{subject}\" was deleted successfully."
      redirect_to wikis_path
    else
      flash[:error] = "There was an error deleting the wiki."
      render :show
    end
  end
end






