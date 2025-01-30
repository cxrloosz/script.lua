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

-- Variável para controlar o estado do script
local endlessEnabled = false
local running = false

-- Função para executar o código quando ativado
local function executeScript()
    while endlessEnabled and task.wait(1) do -- Loop enquanto estiver ativado
        local args = {
            [1] = "/\229\133\179\229\141\161\231\179\187\231\187\159/\229\133\179\229\141\161\229\149\134\228\186\186/\230\140\145\230\136\152\228\184\187\231\186\191?\232\180\173\228\185\176",
            [2] = "/\229\133\179\229\141\161\231\179\187\231\187\159/\228\184\187\231\186\191\229\133\179\229\141\161/\228\184\187\231\186\191\229\156\186\230\153\1759/\228\184\187\231\186\191\229\156\186\230\153\1759-5"
        }

        game:GetService("ReplicatedStorage").Packages.WuKong.RemoteActionFunction:InvokeServer(unpack(args))
        print("Script executado")
    end
end

-- Função para alternar ativação
local function toggleEndless()
    endlessEnabled = not endlessEnabled -- Alterna entre true e false

    if endlessEnabled then
        print("Endless Script Ligado!")
        if not running then
            running = true
            task.spawn(executeScript) -- Executa o script em uma thread separada
        end
    else
        print("Endless Script Desligado!")
        running = false
    end
end

-- Botão para ativar/desativar o script
Tabs.Main:AddButton({ 
    Title = "Ativar/Desativar Endless", 
    Callback = function() 
        toggleEndless()
    end 
})

-- Toggle para ativar/desativar o script
local Toggle = Tabs.Main:AddToggle("Endless", {
    Title = "Endless", 
    Description = "StarGemsFarm",
    Default = false, 
    Callback = function(state)
        endlessEnabled = state
        if state then
            print("Toggle Ligado")
            if not running then
                running = true
                task.spawn(executeScript)
            end
        else
            print("Toggle Desligado")
            running = false
        end
    end 
})
