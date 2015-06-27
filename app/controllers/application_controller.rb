class ApplicationController < ActionController::API
	protect_from_forgery with: :null_session

	attr_reader :current_user

	def authenticate
		cmd = AuthenticateUser.call(get_auth_token)
		if cmd.success?
			@current_user = cmd.result
		else
			render json: {error: cmd.error}, status: :unauthorized
			false
		end
	end

	private

	def get_auth_token
		auth_header = request.headers['Authorization'].split(' ').last
	end

end
