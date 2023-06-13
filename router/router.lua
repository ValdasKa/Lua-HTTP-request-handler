local router = {}
local route = require("app.route")

function router.EndpointsInitialize()
    route.Post('house',
    dofile("www/app/controller/house_controller.lua").Post, 'protected')
    route.Get('house',
    dofile("www/app/controller/house_controller.lua").Get, 'protected')
    route.Put('house',
    dofile("www/app/controller/house_controller.lua").Put, 'protected')
    route.Delete('house',
    dofile("www/app/controller/house_controller.lua").Delete, 'protected')
    -- authentication token get
    route.Post('auth',
    dofile("www/app/controller/jwt_authentication_controller.lua").GetToken, 'public')

end
function router.SetPath(endpoint, method)
    if not dofile("www/utils/valid_path.lua").PathValidation(endpoint, method, route) then
        return
    end
    local rout = route.GetRoute(endpoint, method)
    if rout and rout["type"] == 'protected' then
        -- later finish jwt add
            return rout["controller"]()
    end
    if rout and rout["type"] == 'public' then
        return rout["controller"]()
    end
end

return router