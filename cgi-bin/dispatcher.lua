_Cjson = require "cjson"
package.path = ";/www/?.lua"
require("utils.get_set_input")
local getset = require("utils.get_set_input")
local router = require("router.router")


local function send_response(response)
    uhttpd.send("Status: 200\r\n")
    uhttpd.send("Content-Type: application/json\r\n\r\n")
    uhttpd.send(response)
end


-- Main body required by uhhtpd-lua plugin
function handle_request(env)

    -- router.EndpointsInitialize()
    -- -- reikia parseri pasidaryt
    -- local response = router.SetPath(getset:GetInput("path"), getset:GetInput("env").REQUEST_METHOD)
    -- -- prideti code
    -- -- headeri? content type?
    -- -- or body?

    -- send_response(response .. "\n")
	
    -- uhttpd.send(getset:GetInput("status"))
    -- Injected uhttpd method
    -- here is simple print
    if env["REQUEST_METHOD"] == 'GET' then response = dofile("www/app/controller/house_controller.lua").Get() end
    if env["REQUEST_METHOD"] == 'POST' then response = dofile("www/app/controller/house_controller.lua").Post() end
    send_response(response .. "\n")
    uhttpd.send(_Cjson.encode(env)) --  gal reikes
	
    --endpoint:handle_request()
end

-- riekia prideti kad kviestu is router
-- reikia is kart pasidaryti kad auto butu 