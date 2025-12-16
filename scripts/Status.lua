Status = {}

function Status.update(character)
    for s, turns in pairs(character.status) do
        if s == "poison" then
            character.hp = character.hp - 2
            print(character.name .. " took poison damage !")
        end

        character.status[s] = turns - 1
        if character.status[s] <= 0 then
            character.status[s] = nil
        end
    end

    if character.hp <= 0 then
        character.alive = false
        print(character.name .. " died !")
    end
end

function Status.has(character, type)
    return character.status[type] ~= nil
end