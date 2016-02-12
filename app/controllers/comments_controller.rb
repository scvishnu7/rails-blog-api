class CommentsController < ApplicationController
  protect_from_forgery with: :null_session
  rescue_from ActiveRecord::RecordNotFound, with: :no_record
  rescue_from ActionController::ParameterMissing, with: :no_paramter
  def no_record
    render json: { status: :failed, message: 'record not found!' }
  end

  def no_paramter
    render json: { status: :failed, message: '1 or more paramter is missing' }
  end

  def create
    @comment = Comment.create(comment_params)
    @comment.article_id=params[:article_id]
    @comment.save
    render json: { status: :ok, message: 'Comment Added', id: @comment.id }
  end

  def index
    article = Article.find(params[:article_id])
    @comments = article.comments

    render json: { status: :ok, message: 'Success', comments: @comments }
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update_attributes(comment_params)
    render json: { status: :ok, message: 'Comment Updated', id: @comment.id }
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    render json: { status: :ok, message: 'Comment Deleted', id: @comment.id }
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body, :article_id)
  end
end
