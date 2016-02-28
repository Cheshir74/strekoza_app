class ArticlesController < ApplicationController

  before_action :authenticate_user!, except: [ :index, :show]

  def new
    @article = Article.new
  end

  def create

    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render 'new'
    end

  end

  def show
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  private

    def article_params
      params.require(:article).permit(:title, :body)
    end
end
