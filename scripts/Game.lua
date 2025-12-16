dofile("Lua/Character.lua")
dofile("Lua/Status.lua")
dofile("Lua/Skills.lua")
dofile("Lua/TurnManager.lua")
dofile("Lua/SaveSystem.lua")

Game = {
    player = nil,
    enemies = {},
    all = {},
    waitingInput = false
}

function Game.start()
    Game.player = Character.new("You", 40, 6, 10, true)
    Game.enemies = {
        Character.new("Goblin", 20, 4, 6, false)
        Character.new("Slime", 15, 3, 4, false)
    }

    Game.all = {Game.player, Game.enemies[1], Game.enemies[2]}
    TurnManager.build(Game.all)

    print("Game Started >.<")
    Game.nextTurn()
end

function Game.nextTurn()
    local actor = TurnManager.next()
    if not actor or not actor.alive then return end

    actor.defending = false
    Status.update(actor)

    if Status.has(actor, "stun") then
        print(actor.name .. " is stunned !")
        Game.nextTurn()
        return
    end

    if actor.isPlayer then
        Game.waitingInput = true
        print("Your turn :P")
    else
        Skills.attack(actor, Game.player)
        Game.nextTurn()
    end
end

function Game.playerAction(action, enemyIndex)
    if action == "attack" then
        Skills.attack(Game.player, Game.enemies[enemyIndex])
    else if action == "defend" then
        Skills.defend(Game.player)
    else if action == "poison" then
        Skills.poison(Game.player, Game.enemies[enemyIndex])
    else if action == "heal" then
        Skills.heal(Game.player)
    end

    Game.waitingInput = false
    Game.nextTurn()
end

Game.start()