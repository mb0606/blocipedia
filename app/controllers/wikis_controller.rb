class WikisController < ApplicationController
  def index
    @wikis = Wiki.all
  end

  def new
    @wiki = Wiki.new
  end

  def show
    @wiki = Wiki.find(params[:id])
    @wiki.articles    
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end

  def create
    @wiki = Wiki.new(params[:wiki])
    if @wiki.save
      redirect_to @wiki
    else
      render :new
    end
  end

  def update
    @wiki = Wiki.find(params[:id])
    if @wiki.update_attributes(params[:wiki])
      redirect_to @wiki
    else
      render :edit
    end
  end

  def destroy
    @wiki = Wiki.find(params[:id])
    if @wiki.destroy
      redirect_to wikis_path
    else
      render :show
    end
  end
end






