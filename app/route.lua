local route = {}
local routeList = {}

function route.GetList()
    if routeList then 
        return routeList
    end
end

function route.GetRoute(endpoint, method)
    for _, value in ipairs(routeList) do
        if Contains(value, endpoint) and Contains(value, method) 
        then
            return value
        end
        return false
    end
end
-- -- fix function
-- function route.Post(endpoint, controller)
--     --
--     for _, value in ipairs(routeList) do
--     if Contains(value, endpoint) and Contains(value, "POST")
--     and Contains(value, controller) then
--         return true --
--     end
-- end
--     if false then
--     -- fix here smth?
--     table.insert(routeList,{
--         ["endpoint"] = endpoint,
--         ["REQUEST_METHOD"] = "POST",
--         ["controller"] = controller
--        })
--        return true
--     end
--     return false
-- end

-- -- check later for fixes
function route.Get(endpoint, controller, type)
    -- make check if exist
    for _, value in ipairs(routeList) do
        --if got GET ?
        if Contains(value, endpoint) and Contains(value, "GET") then
            return true
        end
    end
    if false then
   table.insert(routeList,{
    ["endpoint"] = endpoint,
    ["REQUEST_METHOD"] = "GET",
    ["controller"] = controller,
   })
   return true
    end
end

return route