class HeadersController < ApplicationController

	def update
		h = Header.find(params[:id])
		h.text = params[:data][:text]
		if h.save
			render json: h, serializer: HeaderSerializer
		end
	end

end
