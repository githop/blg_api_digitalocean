
#TODO: setup login_user service, auth_controller a bunch of other stuff.
class TokenHandler
	class << self
		def encode_auth_token(user, exp: 1.day.from_now.to_i)
			payload = {user_id: user.id, sub: 'auth', exp: exp, role: user.role}
			JWT.encode(payload, user.password_digest, algorithm)
		end

		def decode_auth_token(token)
			user = get_user_from_token(token)
			payload, _ = JWT.decode(token, user.password_digest, algorithm, {'sub' => 'auth', verify_sub: true})
			[user, payload]
		end

		private

		def algorithm
			'HS256'
		end

		def decode_without_verification(token)
			JWT.decode(token, nil, false, verify_expiration: false)
		end

		def get_user_from_token(token)
			payload, _ = decode_without_verification(token)
			User.find(payload['user_id'])
		end
	end
end