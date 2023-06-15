cjson = require "cjson"
Jwt = require "luajwtjitsi"
package.path = ";/www/?.lua"
getset = require("utils.get_set_input")
local router = require("router.router")
require("utils.contains")
local RequestParser = require("utils.parser")
HttpResponseCode = require("core.http_code_handler")

local function send_response(response)
    -- uhttpd.send("Status: 200\r\n")
    -- uhttpd.send("Content-Type: application/json\r\n\r\n")
    -- uhttpd.send(response)
    uhttpd.send(getset:GetInput("status"))
    getset:SetInput("headers", {})
    table.insert(getset:GetInput("headers"),"Content-Type:application/json\n")
    table.insert(getset:GetInput("headers"),"Cache-Control: no-cache\n\n")
    for key, value in pairs(getset:GetInput("headers")) do
            uhttpd.send(value)
        end
    getset:SetInput("body", cjson.encode({["data-body"] = getset:GetInput("data-body")}) .. "\n" .. cjson.encode({["data-uri"] = getset:GetInput("data-uri")}))
    uhttpd.send((getset:GetInput("body")))
    uhttpd.send("\n" .. cjson.encode(response))
    

    -- uhttpd.send("<br>")
    
    -- uhttpd.send(cjson.encode(getset:GetInput("env").QUERY_STRING))
    uhttpd.send(cjson.encode(getset:GetInput("env")))
end
-- Main body required by uhhtpd-lua plugin
function handle_request(env)
    
    -- uhttpd.send("Status: 200\r\n")
    -- uhttpd.send("Content-Type: text/html\r\n\r\n")
    
    router.EndpointsInitialize()
    if (RequestParser.ParseRequest(env)) then
        -- uhttpd.send(tostring(RequestParser.ParseRequest(env)))
        local response = router.SetPath(getset:GetInput("path"), getset:GetInput("env").REQUEST_METHOD)
        -- local response = getset:GetInput("env").REQUEST_METHOD
        -- uhttpd.send("<br>")
        -- uhttpd.send()
        -- uhttpd.send("<br>")
        send_response(response)
	end
end