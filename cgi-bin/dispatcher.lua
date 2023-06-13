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
    uhttpd.send(getset:GetInput("status"))
    getset:SetInput("headers", {})
    table.insert(getset:GetInput("headers"),"Content-Type:application/json\n")
    table.insert(getset:GetInput("headers"),"Cache-Control: no-cache\n\n")
    uhttpd.send("\n" .. cjson.encode(response))
    uhttpd.send(cjson.encode(getset:GetInput("env")))
end
-- Main body required by uhhtpd-lua plugin
function handle_request(env)
    
    -- uhttpd.send("Status: 200\r\n")
    -- uhttpd.send("Content-Type: text/html\r\n\r\n")
    router.EndpointsInitialize()
    if (RequestParser.ParseRequest(env)) then
        local response = router.SetPath(getset:GetInput("path"), getset:GetInput("env").REQUEST_METHOD)
        send_response(response)
	end
end