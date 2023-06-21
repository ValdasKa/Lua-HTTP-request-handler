local house_controller = {}

-- check table exist? for later

-- add print table test 

local sqlite3 = require("luasql.sqlite3")

path = dofile("www/app/database/db.lua").path


-- function house_controller.letsgo()
-- local env = assert(sqlite3.sqlite3()) -- create the context
-- local conn = assert(env:connect(path)) -- connect to the DB
-- local cursor = assert(conn:execute("SELECT * FROM house"))
-- local row = {}
-- while cursor:fetch(row) do -- print all elements
--    print(table.concat(row, ' | '))
--    uhttpd.send(table.concat(row, ' | '))
-- end
-- cursor:close() -- close the record fetching handler
-- conn:close()  -- close the connection to the DB
-- env:close() -- release the context
-- end


-- path = dofile("www/app/database/db.lua").path

function house_controller.Get()
    local env = assert(sqlite3.sqlite3()) -- create the context
local conn = assert(env:connect(path)) -- connect to the DB
local cursor = assert(conn:execute("SELECT * FROM house"))
-- local row = {}
local row = cursor:fetch ({}, "a")
print()
print("-------------------------------house table-------------------------------")
while row do -- print all elements
    print((string.format("Id: %s, street: %s, house_number: %s, apartment: %s", row.id, row.street, row.house_number, row.apartment)))
    -- print(table.concat(row, ' | '))
--    uhttpd.send(table.concat(row, ' | '))
    row = cursor:fetch (row, "a")
end
cursor:close() -- close the record fetching handler
conn:close()  -- close the connection to the DB
env:close() -- release the context
    -- print(path)
    print("\n")
    Payload:GetInput("body")
    HttpResponseCode:send200()
    -- house_controller.letsgo()
    return "house controller GET reached"
   
end
-- house_controller.Get()

function house_controller.Post()

    HttpResponseCode:send200()
    return "house controller POST reached"--Payload:GetInput("data-body")
end
function house_controller.Delete()
    HttpResponseCode:send200()
    return "house controller DELETE reached"
end
function house_controller.Put()
    HttpResponseCode:send200()
    return "house controller PUT reached"
end
return house_controller