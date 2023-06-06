cjson = require "cjson"
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
    -- local response
    -- if env["REQUEST_METHOD"] == 'GET' then response = dofile("www/app/controller/house_controller.lua").Get() end
    -- if env["REQUEST_METHOD"] == 'POST' then response = dofile("www/app/controller/house_controller.lua").Post() end
    -- if env["REQUEST_METHOD"] == 'PUT' then response = dofile("www/app/controller/house_controller.lua").Put() end
    -- if env["REQUEST_METHOD"] == 'DELETE' then response = dofile("www/app/controller/house_controller.lua").Delete() end
    -- send_response(response .. "\n")
    --     uhttpd.send(cjson.encode(env))
end