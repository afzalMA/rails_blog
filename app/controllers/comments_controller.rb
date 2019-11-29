class CommentsController < ApplicationController
	before_action :fetch_article

	
	def new
		# @comment = Comment.new
	end


	private

	def fetch_article
		@article = Article.find(params[:article_id])
	end
end
