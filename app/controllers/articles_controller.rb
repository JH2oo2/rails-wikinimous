class ArticlesController < ApplicationController
  def index
    @article = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to articles_path
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    redirect_to articles_path
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    # No need for app/views/articles/destroy.html.erb
    redirect_to articles_path, status: :see_other
  end

private

  def article_params
    params.require(:article).permit(:title, :content)
  end

end
