local router = {}
local route = require("app.route")

function router.EndpointsInitialize()
    -- --POST
    route.Post('house',
    dofile("www/app/controller/house_controller.lua").Post, 'protected')
    -- GET
    route.Get('house',
    dofile("www/app/controller/house_controller.lua").Get, 'protected')
    route.Put('house',
    dofile("www/app/controller/house_controller.lua").Put, 'protected')
    route.Delete('house',
    dofile("www/app/controller/house_controller.lua").Delete, 'protected')

end
function router.SetPath(endpoint, method)
    if not dofile("www/utils/valid_path.lua").PathValidation(endpoint, request_method, route) then
        return
    end

    local rout = route.GetRoute(endpoint, method)
    
    if rout and rout["type"] == 'protected' then
            return rout["controller"]()
        end
end

return router