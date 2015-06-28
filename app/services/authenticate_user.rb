require 'token_handler'

class AuthenticateUser
	prepend SimpleCommand

	attr_reader :headers

	def initialize(headers = {})
		@headers = headers
	end

	def call
		token = http_auth_header
		user, _ = TokenHandler.decode_auth_token(token)
		user
	rescue JWT::ExpiredSignature
		errors.add(:base, "The token is expired")
		nil
	rescue JWT::DecodeError
		errors.add(:base, "the token is invalid")
	end

	def http_auth_header
		if headers['Authorization'].present?
			auth_header = headers['Authorization'].split(' ').last
		else
			errors.add(:base, 'Missing token')
		end
	end

	def error
		errors[:base].try(:first)
	end
end