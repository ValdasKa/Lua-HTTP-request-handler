local jwtauth = {}

local key = "example_key"
local payload = {
	iss = "12345678",
	nbf = os.time(),
	exp = os.time() + 3600,
}
-- encode
local alg = "HS256" -- (default)
function jwtauth.Encode()
	local token, err = Jwt.encode(payload, key, alg)
end
function jwtauth.Decode(token)
	local decoded, err = Jwt.verify(token, alg, key)
	return decoded
end



return jwtauth