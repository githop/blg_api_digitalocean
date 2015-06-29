class AuthController < ApplicationController
	def login
		cmd = LoginUser.call(login_params)

		if cmd.success?
			render json: { token: cmd.result }
		else
			render json: {error: cmd.error}, status: :unauthorized
		end
	end

	private

	def login_params
		params.require(:data).permit(:email, :password)
	end
end