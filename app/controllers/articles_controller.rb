class ArticlesController < ApplicationController
  def index
    @wiki = Wiki.find(params[:wiki_id])
    @articles = @wiki.articles
  end

  def show
    @wiki = Wiki.find(params[:wiki_id])
    @article = Article.find(params[:id])
    if request.path != wiki_article_path(@wiki,@article)
      redirect_to [@wiki,@article], status: :moved_permanently
    end
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
      flash[:notice] = "Article was updated."
      redirect_to [@wiki,@article]
    else
      flash[:error] = "There was an error saving the article. Please try again."
      render :edit 
    end
  end

  def create
    @wiki = Wiki.find(params[:wiki_id])
    @article = Article.new(params[:article])
    @article.wiki = @wiki
    if @article.save
      flash[:notice] = "Article was saved."
      redirect_to [@wiki,@article]
    else
      flash[:error] = " There was an error saving the article. Please try again."
      render :new
    end
  end

  def destroy
    @wiki = Wiki.find(params[:wiki_id])
    @article = Article.find(params[:id])
    title = @article.title
    if @article.destroy
      flash[:notice] = "\"#{title}\" was deleted successfully."
      redirect_to @wiki ##redirect_to[@wiki,:articles] or wiki_articles_path(@wiki)
    else
      flash[:error] = "\"#{title}\" was deleted successfully."
                    ##/wikis/:wiki_id/articles 
      render :show
    end
  end 

end
