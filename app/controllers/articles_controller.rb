class ArticlesController < ApplicationController
  def index
    @wiki = Wiki.find(params[:wiki_id])
    @articles = @wiki.articles
  end

  def show
    @wiki = Wiki.find(params[:wiki_id])
    @article = Article.find(params[:id])
  end

  def new
    @wiki = Wiki.find(params[:wiki_id])
    @article = Article.new
  end

  def edit
    @wiki = Wiki.find(params[:wiki_id])
    @article = Article.find(params[:id])
  end

  def update
    @wiki = Wiki.find(params[:wiki_id])
     ## route to this article is wikis/wiki_id/articles/id
    @article = Article.find(params[:id])
    if @article.update_attributes(params[:article])
      ##params is == to the hash article not just one column 
      redirect_to [@wiki,@article]
    else
      render :edit 
    end
  end

  def create
    @wiki = Wiki.find(params[:wiki_id])
    @article = Article.new(params[:article])
    @article.wiki = @wiki
    if @article.save
      redirect_to [@wiki,@article]
    else
      render :new
    end
  end

  def destroy
    @wiki = Wiki.find(params[:wiki_id])
    @article = Article.find(params[:id])
    if @article.destroy
      redirect_to @wiki ##redirect_to[@wiki,:articles] or wiki_articles_path(@wiki)
    else                ##/wikis/:wiki_id/articles 
      render :show
    end
  end 

end
