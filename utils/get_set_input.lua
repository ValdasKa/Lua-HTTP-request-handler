local getset = {}
function getset:new()
    local self = setmetatable({}, getset)
return self
end


function getset:GetInput(key)
    if self[key] then
        return self[key]
    end
end

function getset:SetInput(key, value)
    if key and value and key ~= "" and value ~= "" then
        self[key] = value
    end
end

return getset