class ArticlesController < ApplicationController

	before_action :find_article, only:[:edit, :update, :destroy]



    def index
        @articles = Article.includes(:comments).all
    end

    def new
    	@article = Article.new
    end

    def create
    	@article = Article.new(article_params)

    	if @article.save
    		# flash.now [:info] = 'article created'
    		redirect_to @article
    	else
    		# logger.debug 'MOHAMMED AFZAL'
    		logger.debug @article.errors.full_messages
    		@article.errors.full_messages
    		# flash.now [:info] = 'failed to create! \n reasons:: '
    		render 'new'
    	end
    end
    	

    def show
        # logger.debug params.inspect
        @article = Article.includes(:comments).find(params[:id])
    end


    def destroy
    	# @article = Article.find(params[:id])
    	@article.destroy if @article
    	redirect_to articles_path
    end

    def edit
    	# @article = Article.find(params[:id])
    	
    end
    def update
    	# @article = Article.find(params[:id])
    	if @article.update(article_params)
    		redirect_to @article
    	else
    		render 'edit'
    	end
    end

    private

    def article_params
    	params.require(:article).permit(:headline, :summary, :body, :conclusion, :ticker )
    end


    def find_article
    	@article = Article.find(params[:id])
    end
 


end
