local house_controller = {}

function house_controller.Get()
    HttpResponseCode:send200()
    return "house controller GET reached"
end
function house_controller.Post()
    HttpResponseCode:send200()
    return "house controller POST reached"
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