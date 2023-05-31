cjson = require "cjson"
package.path = ";/www/?.lua"
getset = require("utils.get_set_input")
local router = require("router.router")
require("utils.contains")
local RequestParser = require("utils.parser")

local function send_response(response)
   
    uhttpd.send("status")
   
    -- uhttpd.send(getset:GetInput("status"))
    uhttpd.send("Content-Type: application/json\n")
    uhttpd.send("Cache-Control: no-cache\n\n")


    uhttpd.send(cjson.encode(cjson.encode(response)))
    uhttpd.send(cjson.encode(getset:GetInput("env")))
    
    -- uhttpd.send("\n" .. cjson.encode(response))
    
end


-- Main body required by uhhtpd-lua plugin
function handle_request(env)

    router.EndpointsInitialize()
    if (RequestParser.ParseRequest(env)) then
    -- reikia parseri pasidaryt
    local response = router.SetPath(getset:GetInput("path"),
    getset:GetInput("env").REQUEST_METHOD)
    send_response(response)
    else
        uhttpd.send("status")
	end
end
