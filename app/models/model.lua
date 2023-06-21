local model = {}


-- db:SendHouse()
model.__index = model
function model:new(data)
    data = data
    setmetatable(data, self)
    self.__index = self
    self.tablename = "default"
    return data
end

function model.GetTable()
    -- do select function here? 
    cursor,errorString = conn:execute("select * from house")
    row = cursor:fetch ({}, "a")

while row do
    print((string.format("Id: %s, street: %s, house_number: %s, apartment: %s", row.id, row.street, row.house_number, row.apartment)))
        -- reusing the table of results
        row = cursor:fetch (row, "a")
    end
end
model.GetTable()

function model.InsertToTable()
    -- conn:execute([[INSERT INTO house values('11','Raj')]])
end
function model.DeleteFromTable()
    -- local delete_statement = db:prepare[[ DELETE FROM list WHERE id = :id]]
end
function model.UpdateTable()
    -- local update_statement = db:prepare[[ UPDATE list SET name = :name, icon = :icon WHERE id = :id]]
end

function model:SetTable(name)
    uhttpd.send("SetTable function?<br>")
    self.tablename = name
end


return model