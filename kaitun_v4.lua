-- config.lua
getgenv().ConfigsKaitun = {
    selectedGearSlot = 1,
    autoBuyCyborg = true,
    autoBuyGhoul = true,
    randomFruit = false,
    randomRaceShop = false,
    copyConfig = false
} 
-- kaitun_v4.lua
local config = getgenv().ConfigsKaitun

-- UTILITÁRIOS (exemplos)
local function joinServer(fullMoon)
    print("[Kaitun] Procurando servidor. fullMoon?", fullMoon)
    -- implementar teleport/redirecionamento
end

local function getCurrentFrags()
    local plr = game.Players.LocalPlayer
    local stats = plr:FindFirstChild("leaderstats")
    return stats and stats:FindFirstChild("Fragments") and stats.Fragments.Value or 0
end

local function ensureFrags(target)
    local current = getCurrentFrags()
    if current < target then
        print("[Kaitun] Farmando fragments até atingir", target)
        -- implementar farm
    else
        print("[Kaitun] Já tem fragments suficientes:", current)
    end
end

local function selectGear(slot)
    print("[Kaitun] Usando gear slot", slot)
    -- implementar switch de gear
end

local function buyRace(race)
    print("[Kaitun] Comprando race:", race)
    -- implementar compra via RemoteEvent
end

local function randomFruit()
    print("[Kaitun] Comprando fruta aleatória")
    -- implementar compra
end

local function randomRaceShop()
    print("[Kaitun] Comprando race aleatória")
    -- implementar compra
end

local function copyConfig()
    local json = game:GetService("HttpService"):JSONEncode(config)
    setclipboard(json)
    print("[Kaitun] Config copiada!")
end

local function shouldStop()
    -- implementar checagens
    return false
end

-- LOOP PRINCIPAL
local function run()
    joinServer(true)
    ensureFrags(1500)
    selectGear(config.selectedGearSlot or 1)

    if config.autoBuyCyborg then buyRace("Cyborg") end
    if config.autoBuyGhoul then buyRace("Ghoul") end
    if config.randomFruit then randomFruit() end
    if config.randomRaceShop then randomRaceShop() end
    if config.copyConfig then copyConfig() end

    if shouldStop() then
        print("[Kaitun] Todas tarefas concluídas. Parando.")
        return
    end

    wait(30)
    run()
end

run()
