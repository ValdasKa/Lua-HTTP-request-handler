local valid_path = {}
require("utils.contains")

function PathExist(endpoint, route)
    for _, value in pairs(route) do
        if Contains(value, endpoint) then
            return true
        end
    end
end
function valid_path.PathValidation(endpoint, method, route)
    if not PathExist(endpoint, route)
    then
        return
    end
    return true
end

return valid_path