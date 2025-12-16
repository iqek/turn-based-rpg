Skills = {}

function Skills.attack(attacker, target)
    local dmg = attacker.atk
    if target.defending then
        dmg = math.floor(dmg/2)
    end

    target.hp = target.hp - dmg
    print(attacker.name .. " attacks" .. target.name .. " !")
end

function Skills.defend(character)
    character.defending = true
    print(character.name .. " is defending")
end

function Skills.poison(attacker, target)
    target.status["poison"] = 3
    print(attacker.name .. " poisoned" .. target.name .. " !")
end

function Skills.heal(character)
    local healAmount = 6
    character.hp = math.min(character.hp + healAmount, character.maxHp)
    print(character.name .. " healed" .. healAmount .. "HP")
end