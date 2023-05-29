local route = {}
local routeList = {}
require("utils.contains")


function route.GetRoute(endpoint, method)
    for _, value in ipairs(routeList) do
        if Contains(value, endpoint) and Contains(value, method) 
        then
            return value
        end
        return false
    end
end
-- fix function
function route.Post(endpoint, controller)
    --
    for _, value in ipairs(routeList) do
    if Contains(value, endpoint) and Contains(value, "GET") then
        return true
    end
    --
    table.insert(routeList,{
        ["endpoint"] = endpoint,
        ["REQUEST_METHOD"] = "POST",
        ["controller"] = controller
        -- ["type"] = type
       })
       
    end
end

--pasiziureti ar veikia patikrinimai ar reikia patvarkyti
-- function route.Get(endpoint, controller, type)
--     -- make check if exist
--     for _, value in ipairs(routeList) do
--         --if got GET ?
--         if Contains(value, endpoint) and Contains(value, "GET") then
--             return true
--         end
--     end
--     -- make table insert if not exist
--    table.insert(routeList,{
--     ["endpoint"] = endpoint,
--     ["REQUEST_METHOD"] = "GET",
--     ["controller"] = controller,
--     -- ["type"] = type
--    })
-- end

return route