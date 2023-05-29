local router = {}
 local route = require("app.route")

function router.EndpointsInitialize()
    --POST
    route.Post('house',
    dofile("www/app/controller/house_controller.lua").Post)
    --GET
    route.Get('house',
    dofile("www/app/controller/house_controller.lua").Get)
    -- add type later for auth?
end

function router.SetPath(endpoint, method)
    
    if not dofile("www/utils/valid_path.lua").PathValidation(endpoint, method, route) then
        return
    end
    local rout = route.GetRoute(endpoint, method)
    -- tikrinti kita validacija?
    -- padaryti JWT?
    return rout["controller"]()
    --

end


return router