local getset = {}
-- __index check if need to use ??? 
-- If a fallback table is used, remember that it can trigger
-- an __index metamethod on it if it has one, so you can
-- create long chains of fallback tables.
getset.__index = getset
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