local jwt_authentication_controller = {}
local jwtauth = require "utils.jwt_authentication"

function jwt_authentication_controller.GetToken()
    HttpResponseCode:send200()
    return {token = jwtauth.Encode()}
end

return jwt_authentication_controller