class ArticlesController < ApplicationController
  protect_from_forgery with: :null_session
  rescue_from ActiveRecord::RecordNotFound, with: :no_record
  rescue_from ActionController::ParameterMissing, with: :no_paramter

  def no_record
    render json: { status: :failed, message: 'article not found!' }
  end

  def no_paramter
    render json: { status: :failed, message: '1 or more paramter is missing' }
  end

  def index
    @articles = Article.all
    render json: { status: :ok, message: 'Success!', data: @articles }
  end

  def destroy
    @article = Article.find(params[:id])
    @article.delete
    render json: { status: :ok, message: 'Article Deleted', id: @article.id }
  end

  def update
    @article = Article.find(params[:id])
    @article.update_attributes(article_params)
    render json: { status: :ok, message: 'Article Updated', id: @article.id }
  end

  def show
    @article = Article.find(params[:id])
	@comments = @article.comments
    render json: { status: :ok, message: 'Success!', article: @article, comments: @comments }
  end

  def create
    @article = Article.new(article_params)
    @article.save
    render json: { status: :ok, message: 'Article Added', id: @article.id }
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
    end
end
