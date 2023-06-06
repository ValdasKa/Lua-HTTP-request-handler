local route = {}
local routeList = {}

function route.GetList()
    if routeList then 
        return routeList
    end
end

function route.GetRoute(endpoint, method)
    -- uhttpd.send("Before")

    for _, value in ipairs(routeList) do
        if Contains(value, endpoint) and Contains(value, method)
        then
            -- uhttpd.send("If<br>")
            return value
        end
        -- uhttpd.send("Outside if<br>")
    end
    return false
end
-- fix function
function route.Post(endpoint, controller, type)
    for _, value in ipairs(routeList) do
    if Contains(value, endpoint) and Contains(value, "POST")
    and Contains(value, controller) then
        return true
    end
end
    table.insert(routeList,{
        ["endpoint"] = endpoint,
        ["REQUEST_METHOD"] = "POST",
        ["controller"] = controller,
        ["type"] = type
       })
       return true
end

-- -- check later for fixes
function route.Get(endpoint, controller, type)
    for _, value in ipairs(routeList) do
        if Contains(value, endpoint) and Contains(value, "GET")
        and Contains(value, controller) then
            return true
        end
    end
   table.insert(routeList,{
    ["endpoint"] = endpoint,
    ["REQUEST_METHOD"] = "GET",
    ["controller"] = controller,
    ["type"] = type
   })
        return true
end
function route.Put(endpoint, controller, type)
    for _, value in ipairs(routeList) do
        if Contains(value, endpoint) and Contains(value, "PUT")
        and Contains(value, controller) then
            return true
        end
    end
    table.insert(routeList,{
    ["endpoint"] = endpoint,
    ["REQUEST_METHOD"] = "PUT",
    ["controller"] = controller,
    ["type"] = type
    })
        return true
end
function route.Delete(endpoint, controller, type)
    for _, value in ipairs(routeList) do
        if Contains(value, endpoint) and Contains(value, "Delete")
        and Contains(value, controller) then
            return true
        end
    end
    table.insert(routeList,{
    ["endpoint"] = endpoint,
    ["REQUEST_METHOD"] = "Delete",
    ["controller"] = controller,
    ["type"] = type
    })
        return true
end

return route