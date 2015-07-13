class ArticlesController < ApplicationController
	before_action :authenticate, only: :create

	def index
		@articles = Article.includes(:imgs, :user, headers: :paragraphs)
		render json: @articles, each_serializer: ArticleSerializer, include: 'user,imgs,headers,paragraphs'
	end

	def show
		@article = Article.includes(:imgs, :user, headers: :paragraphs).find(params[:id])
		render json: @article, serializer: ArticleSerializer, include: 'user,imgs,headers,paragraphs'
	end

	def create
		article = params[:article]
		title = article[:title]
		imgs  = article[:imgs]
		headers = article[:headers]
		d = article[:postedOn].split('-').map(&:to_i)

		a = Article.new(title: title, posted_on: Date.new(d[0], d[1], d[2]));
		a.user = @current_user

		imgs.each do |img|
			a.imgs << Img.new(href: imgur_url(img[:id], img[:ext]), title: img[:title])
		end

		headers.each do |h|
			header = Header.new(text: h[:text])
			h[:paragraphs].each do |para|
				header.paragraphs << Paragraph.new(body: para[:text])
			end
			a.headers << header
		end

		if a.save
			render json: {response: 'Post sucessfully created!'}
		end
	end

	private

	def imgur_url(id, ext)
		imgur_url = 'http://i.imgur.com/'
		path = "#{id}.#{ext}"
		imgur_url + path
	end
end
