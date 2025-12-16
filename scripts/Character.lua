Character = {}

function Character.new(name, hp, atk, speed, isPlayer)
    return {
        name = name,
        maxHp = hp,
        atk = atk,
        speed = speed,
        isPlayer = isPlayer,
        alive = true,
        defending = false,
        status = {}
    }
end