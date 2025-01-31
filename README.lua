-- Biblioteca
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local Window = Fluent:CreateWindow({
    Title = "AFEchoes " .. Fluent.Version,
    TabWidth = 160, 
    Size = UDim2.fromOffset(580, 460), 
    Theme = "Dark"
})

local Tabs = {
    Main = Window:AddTab({ Title = "Script" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

-- Descrição
Tabs.Main:AddParagraph({ Title = "AFE", Content = "CxrloScript" })

-- Variáveis para controle dos loops
local toggles = {
    endless = false,
    cardFuse = false,
    raidBoss = false
}

-- Função genérica para executar ações
local function executeAction(actionType)
    while toggles[actionType] and task.wait(actionType == "cardFuse" and 1 or 0) do
        local args = {}

        if actionType == "endless" then
            args = {
                [1] = "/\229\133\179\229\141\161\231\179\187\231\187\159/\229\133\179\229\141\161\229\149\134\228\186\186/\230\140\145\230\136\152\230\183\177\230\184\138?\232\180\173\228\185\176"
            }
        elseif actionType == "cardFuse" then
            args = {
                [1] = "/\229\141\161\231\137\140\231\179\187\231\187\159/\229\141\161\231\137\140\229\149\134\228\186\186/\232\158\141\229\144\136\229\141\161\231\137\140?\232\180\173\228\185\176",
                [2] = "/\229\141\161\231\137\140\231\179\187\231\187\159/\229\141\161\231\137\140\232\131\140\229\140\133/\229\190\161\229\157\130\231\190\142\231\144\180",
                [3] = "__null__",
                [4] = { [1] = -20 }
            }
        elseif actionType == "raidBoss" then
            args = {
                [1] = "/\229\133\179\229\141\161\231\179\187\231\187\159/\229\133\179\229\141\161\229\149\134\228\186\186/\230\140\145\230\136\152Boss?\232\180\173\228\185\176",
                [2] = "__null__",
                [3] = "__null__",
                [4] = { [1] = 1 }
            }
        end

        game:GetService("ReplicatedStorage").Packages.WuKong.RemoteActionFunction:InvokeServer(unpack(args))
        print(actionType .. " Executado")
    end
end

-- Função para criar toggles
local function createToggle(id, title, description)
    return Tabs.Main:AddToggle(id, {
        Title = title,
        Description = description,
        Default = false,
        Callback = function(state)
            toggles[id] = state
            print(title .. (state and " Ligado!" or " Desligado!"))
            if state then task.spawn(function() executeAction(id) end) end
        end
    })
end

-- Criando os toggles
createToggle("endless", "Endless", "Liga/desliga o Endless automaticamente")
createToggle("cardFuse", "CardFuse", "Liga/desliga o CardFuse automaticamente")
createToggle("raidBoss", "RaidBoss", "Liga/desliga o RaidBoss automaticamente")
