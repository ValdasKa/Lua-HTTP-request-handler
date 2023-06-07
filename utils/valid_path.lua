local valid_path = {}
local function PathExist(endpoint, route)
    for _, value in pairs(route.GetList()) do
        if Contains(value, endpoint) then
            return true
        end
    end
    HttpResponseCode:send404()
end
local function PathRequestValidation(endpoint, method, route)
    for _, value in pairs(route.GetList()) do
        if Contains(value, endpoint) and Contains(value, method)
        then
            return true
        end
    end
end
function valid_path.PathValidation(endpoint, method, route)
    if not PathExist(endpoint, route)
    then
        return
    end
    -- uhttpd.send("<br>")
    -- uhttpd.send(method)
    -- uhttpd.send("<br>")
    if PathRequestValidation(endpoint, method, route) then
        return true
    end
end

return valid_path
