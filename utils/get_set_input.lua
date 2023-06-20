local Payload = {}
-- __index check if need to use ??? 
-- If a fallback table is used, remember that it can trigger
-- an __index metamethod on it if it has one, so you can
-- create long chains of fallback tables.
Payload.__index = Payload
function Payload:new()
    local self = setmetatable({}, Payload)
return self
end
function Payload:GetInput(key)
    if self[key] then
        return self[key]
    end
end
function Payload:SetInput(key, value)
    if key and value and key ~= "" and value ~= "" then
        self[key] = value
    end
end

return Payload