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
    end
    return false
end
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
        if Contains(value, endpoint) and Contains(value, "DELETE")
        and Contains(value, controller) then
            return true
        end
    end
    table.insert(routeList,{
    ["endpoint"] = endpoint,
    ["REQUEST_METHOD"] = "DELETE",
    ["controller"] = controller,
    ["type"] = type
    })
        return true
end
return route