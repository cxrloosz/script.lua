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

-- Variável para controle do loop
local endlessEnabled = false

-- Função para executar o código quando ativado
local function executeScript()
    while endlessEnabled and task.wait(1) do -- Loop enquanto ativado
        local args = {
            [1] = "/\229\133\179\229\141\161\231\179\187\231\187\159/\229\133\179\229\141\161\229\149\134\228\186\186/\230\140\145\230\136\152\228\184\187\231\186\191?\232\180\173\228\185\176",
            [2] = "/\229\133\179\229\141\161\231\179\187\231\187\159/\228\184\187\231\186\191\229\133\179\229\141\161/\228\184\187\231\186\191\229\156\186\230\153\1759/\228\184\187\231\186\191\229\156\186\230\153\1759-5"
        }

        game:GetService("ReplicatedStorage").Packages.WuKong.RemoteActionFunction:InvokeServer(unpack(args))
        print("Script executado")
    end
end

-- Adicionando o Toggle na interface
Tabs.Main:AddToggle("EndlessToggle", {
    Title = "Endless",
    Description = "Liga/desliga o script automaticamente",
    Default = false,
    Callback = function(state)
        endlessEnabled = state -- Ativa ou desativa
        if endlessEnabled then
            print("Endless Script Ligado!")
            task.spawn(executeScript) -- Inicia a execução
        else
            print("Endless Script Desligado!")
        end
    end
})
