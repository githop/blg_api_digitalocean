class ApplicationController < ActionController::API

	attr_reader :current_user

	def authenticate
		cmd = AuthenticateUser.call(request.headers)
		if cmd.success?
			@current_user = cmd.result
		else
			render json: {error: cmd.error}, status: :unauthorized
			false
		end
	end

end
