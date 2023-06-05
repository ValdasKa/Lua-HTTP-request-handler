cjson = require "cjson"
package.path = ";/www/?.lua"
getset = require("utils.get_set_input")
local router = require("router.router")
require("utils.contains")
local RequestParser = require("utils.parser")

local function send_response(response)
    uhttpd.send("Status: 200\r\n")
    uhttpd.send("Content-Type: application/json\r\n\r\n")
    uhttpd.send(response)
end
-- Main body required by uhhtpd-lua plugin
function handle_request(env)
    local response
    if env["REQUEST_METHOD"] == 'GET' then response = dofile("www/app/controller/house_controller.lua").Get() end
    if env["REQUEST_METHOD"] == 'POST' then response = dofile("www/app/controller/house_controller.lua").Post() end
    if env["REQUEST_METHOD"] == 'PUT' then response = dofile("www/app/controller/house_controller.lua").Put() end
    if env["REQUEST_METHOD"] == 'DELETE' then response = dofile("www/app/controller/house_controller.lua").Delete() end
    send_response(response .. "\n")
        uhttpd.send(cjson.encode(env))
end