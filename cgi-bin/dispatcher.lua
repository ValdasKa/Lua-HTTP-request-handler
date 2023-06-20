cjson = require "cjson"
Jwt = require "luajwtjitsi"
package.path = ";/www/?.lua"
Payload = require("utils.get_set_input")
local router = require("router.router")
require("utils.contains")
local RequestParser = require("utils.parser")
HttpResponseCode = require("core.http_code_handler")
-- ContentDataValid = require("utils.content_type_valid")

local function send_response(response)
    -- uhttpd.send("Status: 200\r\n")
    -- uhttpd.send("Content-Type: application/json\r\n\r\n")
    -- uhttpd.send(response)
    uhttpd.send(Payload:GetInput("status"))
    Payload:SetInput("headers", {})
    table.insert(Payload:GetInput("headers"),"Content-Type: application/json\n")
    table.insert(Payload:GetInput("headers"),"Cache-Control: no-cache\n\n")
    for key, value in pairs(Payload:GetInput("headers")) do
            uhttpd.send(value)
        end
    Payload:SetInput("body", cjson.encode({["data-body"] = Payload:GetInput("data-body")}) .. "\n" .. cjson.encode({["data-uri"] = Payload:GetInput("data-uri")}))
    uhttpd.send((Payload:GetInput("body")))
    uhttpd.send("\n" .. cjson.encode(response))
    

    -- uhttpd.send("<br>")
    
    -- uhttpd.send(cjson.encode(getset:GetInput("env").QUERY_STRING))
    uhttpd.send(cjson.encode(Payload:GetInput("env")))
end
-- Main body required by uhhtpd-lua plugin
function handle_request(env)
    
    uhttpd.send("Status: 200\r\n")
    uhttpd.send("Content-Type: application/json\r\n\r\n")
    -- uhttpd.send("")
    
    router.EndpointsInitialize()
    if (RequestParser.ParseRequest(env)) then
        local response = router.SetPath(Payload:GetInput("path"), Payload:GetInput("env").REQUEST_METHOD)
        send_response(response)
	end
end