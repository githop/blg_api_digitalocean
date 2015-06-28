class ArticlesController < ApplicationController
	before_action :authenticate, only: :create

	def index
		@articles = Article.includes(:imgs, headers: :paragraphs)
		render json: @articles, each_serializer: ArticleSerializer, include: 'imgs,headers,paragraphs'
	end

	def show
		@article = Article.includes(:imgs, headers: :paragraphs).find(params[:id])
		render json: @article, serializer: ArticleSerializer, include: 'imgs,headers,paragraphs'
	end

	def create
		render json: {indeed: "it worked"}
	end
end
