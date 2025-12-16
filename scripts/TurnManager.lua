TurnManager = {
    queue = {}
    index = 1
}

function TurnManager.build(characters)
    TurnManager.queue = {}

    for _, c in ipairs(characters) do
        if c.alive then
            table.insert(TurnManager.queue, c)
        end
    end

    table.sort(TurnManager.queue, function(a,b)
        return a.speed > b.speed
    end)

    TurnManager.index = 1
end

function TurnManager.next()
    if TurnManager.index > #TurnManager.queue then
        TurnManager.index = 1
    end

    local actor = TurnManager.queue[TurnManager.index]
    TurnManager.index = TurnManager.index + 1
    return actor
end