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
-- fix function
function route.Post(endpoint, controller, type)
    local test = true
    for _, value in ipairs(routeList) do
    if Contains(value, endpoint) and Contains(value, "POST")
    and Contains(value, controller) then
        return true
    end
end
    if not test then
    table.insert(routeList,{
        ["endpoint"] = endpoint,
        ["REQUEST_METHOD"] = "POST",
        ["controller"] = controller,
        ["type"] = type
       })
       return true
    end
    return false
end

-- -- check later for fixes
function route.Get(endpoint, controller, type)
    local test = true
    for _, value in ipairs(routeList) do
        if Contains(value, endpoint) and Contains(value, "GET")
        and Contains(value, controller) then
            return true
        end
    end
    if not test then
   table.insert(routeList,{
    ["endpoint"] = endpoint,
    ["REQUEST_METHOD"] = "GET",
    ["controller"] = controller,
    ["type"] = type
   })
        return true
    end
    return false
end

return route