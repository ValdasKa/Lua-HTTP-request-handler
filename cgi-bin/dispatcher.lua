cjson = require "cjson"
package.path = ";/www/?.lua"
getset = require("utils.get_set_input")
local router = require("router.router")
require("utils.contains")
local RequestParser = require("utils.parser")

local function send_response(response)
    -- uhttpd.send("status")
    uhttpd.send(getset:GetInput("status"))
    getset:SetInput("headers", {})
    table.insert(getset:GetInput("headers"),"Content-Type:application/json\n")
    table.insert(getset:GetInput("headers"),"Cache-Control: no-cache\n\n")
    for key, value in pairs(getset:GetInput("headers")) do
        uhttpd.send(value)
    end
    getset:SetInput("body", cjson.encode({["data-body"] = getset:GetInput("data-body")}) .. "\n" .. 
    cjson.encode({["data-uri"] = getset:GetInput("data-uri")}))
    uhttpd.send(getset:GetInput("body"))
    if response then
       uhttpd.send("\n" .. cjson.encode(response))
    end
    uhttpd.send(cjson.encode(getset:GetInput("env")))
    uhttpd.send("\n" .. cjson.encode(cjson.encode(response)))

    -- uhttpd.send("status")
    -- uhttpd.send("Content-Type: application/json\n")
    -- uhttpd.send("Cache-Control: no-cache\n\n")
    -- uhttpd.send(response)
    -- uhttpd.send(cjson.encode(getset:GetInput("env")))
end
-- Main body required by uhhtpd-lua plugin
function handle_request(env)

    router.EndpointsInitialize()
    if (RequestParser.ParseRequest(env)) then
    local response = router.SetPath(getset:GetInput("path"),
    getset:GetInput("env").REQUEST_METHOD)
    send_response(response)
	end
end