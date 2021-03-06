class ParagraphsController < ApplicationController
	before_action :authenticate, :only => :update

	def update
		para = Paragraph.find(params[:id])
		para.body = params[:data][:body]
		if para.save
			render json: para, serializer: ParagraphSerializer
		end
	end

end