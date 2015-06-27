require 'token_handler'

class AuthenticateUser
	prepend SimpleCommand

	attr_reader :token

	def initialize(token)
		@token = token
	end

	def call
		user, _ = TokenHander.decode_auth_token(token)
		user
	rescue JWT::ExpiredSignature
		errors.add(:base, "The token is expired")
		nil
	rescue JWT::DecodeError
		errors.add(:base, "the token is invalid")
	end

	def error
		errors[:base].try(:first)
	end
end