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

-- Variáveis de controle
local endlessEnabled = false
local cardFuseEnabled = false

-- Função para executar o Endless
local function executeEndless()
    while endlessEnabled do
        local args = {
            [1] = "/\229\133\179\229\141\161\231\179\187\231\187\159/\229\133\179\229\141\161\229\149\134\228\186\186/\230\140\145\230\136\152\228\184\187\231\186\191?\232\180\173\228\185\176",
            [2] = "/\229\133\179\229\141\161\231\179\187\231\187\159/\228\184\187\231\186\191\229\133\179\229\141\161/\228\184\187\231\186\191\229\156\186\230\153\1759/\228\184\187\231\186\191\229\156\186\230\153\1759-5"
        }

        game:GetService("ReplicatedStorage").Packages.WuKong.RemoteActionFunction:InvokeServer(unpack(args))
        print("Endless Executado")
        wait(1) -- Evita sobrecarga
    end
end

-- Função para executar o CardFuse
local function executeCardFuse()
    while cardFuseEnabled do
        local args = {
            [1] = "/\229\141\161\231\137\140\231\179\187\231\187\159/\229\141\161\231\137\140\229\149\134\228\186\186/\232\158\141\229\144\136\229\141\161\231\137\140?\232\180\173\228\185\176",
            [2] = "/\229\141\161\231\137\140\231\179\187\231\187\159/\229\141\161\231\137\140\232\131\140\229\140\133/\229\191\151\230\157\145\230\150\176\229\133\171",
            [3] = "null",
            [4] = {
                [1] = -30
            }
        }

        game:GetService("ReplicatedStorage").Packages.WuKong.RemoteActionFunction:InvokeServer(unpack(args))
        print("CardFuse Executado")
        wait(1) -- Evita sobrecarga
    end
end

-- Toggle para ativar/desativar o Endless
Tabs.Main:AddToggle("EndlessToggle", {
    Title = "Endless",
    Description = "Liga/desliga o Endless automaticamente",
    Default = false,
    Callback = function(state)
        endlessEnabled = state -- Ativa ou desativa
        if endlessEnabled then
            print("Endless Ligado!")
            task.spawn(executeEndless) -- Inicia a execução
        else
            print("Endless Desligado!")
        end
    end
})

-- Toggle para ativar/desativar o CardFuse
Tabs.Main:AddToggle("CardFuseToggle", {
    Title = "CardFuse",
    Description = "Liga/desliga o CardFuse automaticamente",
    Default = false,
    Callback = function(state)
        cardFuseEnabled = state -- Ativa ou desativa
        if cardFuseEnabled then
            print("CardFuse Ligado!")
            task.spawn(executeCardFuse) -- Inicia a execução
        else
            print("CardFuse Desligado!")
        end
    end
})
