class ArticlesController < ApplicationController
	protect_from_forgery with: :null_session
  	rescue_from ActiveRecord::RecordNotFound, with: :no_record
	rescue_from ActionController::ParameterMissing, with: :no_paramter

	def no_record
		render :json => { :status => :failed, :message => "article not found!" }
	end
	def no_paramter
		render :json => { :status => :failed, :message => "1 or more paramter is missing" }
	end
	def index
		@articles = Article.all
		render :json => { :status => :ok, :message => "Success!", :data => @articles }
	end
	def destroy
    		@article = Article.find(params[:id])
		@article.delete
		render :json => { :status => :ok, :message => "Successful deletion!", :deleted => @article.id } 
	end
	def update 
		@article = Article.find(params[:id])
		@articlenew = Article.new(article_params)
		@article.title = @articlenew.title
		@article.text = @articlenew.text
		@article.save
		render :json => { :status => :ok, :message => "updated", :data => @article }
	end
	
	def show
    		@article = Article.find(params[:id])
		render :json => { :status => :ok, :message => "Success!", :data => @article }
  	end
	def create
		@article = Article.new(article_params)
		@article.save
		render :json => { :status => :ok, :message => "success!", :id => @article.id}
	end
	private
		def article_params
			params.require(:article).permit(:title, :text)
		end
end
