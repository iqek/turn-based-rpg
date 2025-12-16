SaveSystem = {}
json = require("json")

function SaveSystem.save(player, enemies)
    local data = {player = player, enemies = enemies}
    local f = io.open("save.json", "w")
    f:write(json.encode(data))
    f:close()
    print("Saved")
end

function SaveSystem.load()
    local f = io.open("save.json", "r")
    local data = json.decode(f:read("*a"))
    f:close()
    print("Loaded")
    return data
end