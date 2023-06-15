local RequestParser = {}
function ParseData(data)
    -- make bonus checker for data? because now return null
    local k, v = {}, {}
    local newdata = {}
    for key in data:gmatch("(.-)\r\n") do
        if string.match(key, "name=") then
            table.insert(k, string.match(key, 'name=".+)"'))
        end
    end
    for key, value in ipairs(k) do
        newdata[value] = v[key]
    end
    return newdata
end
-- https://stackoverflow.com/questions/28916182/parse-parameters-out-of-url-in-lua
function ParseURI(data)
    if not data then return "false" end
    local newdata = {}
    for key, value in string.gmatch(data, "([^&=?]+)=([^&=?]+)")
    do
        key = uhttpd.urldecode(key)
        value = uhttpd.urldecode(value)
        -- uhttpd.send(value)
        newdata[key] = value
    end
    return newdata
end
-- add json printer
function ParseJson(data)
    local status, value = pcall(cjson.decode, data)
    if status then
        return value
    end 
    HttpResponseCode:send400()
end
function ParseBody(body, type)
    if string.match(type, "multipart/form-data")
    then
        return ParseData(body)
    end
    if string.match(type, "application/json")
    then
        return ParseJson(body)
    end
    if string.match(type, "application/x-www-form-urlencoded")
    then
        return ParseURI(body)
    end
end
function RequestParser.ParseRequest(env)
    getset:SetInput("env", env)
    uhttpd.send("<br>")
    getset:SetInput("body", io.read("*all"))
    getset:SetInput("path", string.match(env.PATH_INFO,"^/*(.+)"))

  
    uhttpd.send("\n\n" .. getset:GetInput("env").CONTENT_TYPE)
    getset:SetInput("data-body", ParseBody(getset:GetInput("body"), getset:GetInput("env").CONTENT_TYPE))
    getset:SetInput("data-uri", ParseURI(env.REQUEST_URI))
    return true

end

return RequestParser