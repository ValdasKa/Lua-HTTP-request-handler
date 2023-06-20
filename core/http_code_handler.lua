local codeHandler = {}
function codeHandler:send200()
    Payload:SetInput("status", "Status: 200 \r\n")
    return false
end
function codeHandler:send201()
    Payload:SetInput("status", "Status: 201 \r\n")
    return false
end
function codeHandler:send202()
    Payload:SetInput("status", "Status: 202 \r\n")
    return false
end
function codeHandler:send400()
    Payload:SetInput("status", "Status: 400 \r\n")
    return false
end
function codeHandler:send401()
    Payload:SetInput("status", "Status: 401 \r\n")
    return false
end
function codeHandler:send404()
    Payload:SetInput("status", "Status: 404 \r\n")
    return false
end
function codeHandler:send500()
    Payload:SetInput("status", "Status: 500 \r\n")
    return false
end
function codeHandler:send501()
    Payload:SetInput("status", "Status: 501 \r\n")
    return false
end
function codeHandler:send502()
    Payload:SetInput("status", "Status: 502 \r\n")
    return false
end
return codeHandler