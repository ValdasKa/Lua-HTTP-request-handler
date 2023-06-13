local jwtauth = {}

local key = "example_key"
local alg = "HS256" -- (default)

-- encode
function jwtauth.Encode()
	local payload = {
		iss = "12345678",
		nbf = os.time(),
		exp = os.time() + 3600,
	}
	local token, err = Jwt.encode(payload, key, alg)
	if token then
		return token
	end
	return false
end
-- decode
function jwtauth.Decode(token)
	local decoded, err
	if token then
		decoded, err = Jwt.verify(token, alg, key)
	end
	if decoded then
		return decoded
	end
	return false
end

return jwtauth