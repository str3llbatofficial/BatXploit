-- ============================================================================
-- NYX BACKDOOR SCANNER - CONSOLE EDITION (NO GUI, 100% WORKING)
-- ============================================================================

local player = game.Players.LocalPlayer
local HttpGet = game.HttpGet or game:HttpGet

-- Уведомление через StarterGui
local function notify(title, text, duration)
    pcall(function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = title,
            Text = text,
            Duration = duration or 5
        })
    end)
end

-- Ключевые слова для поиска
local backdoorKeywords = {
    "admin", "backdoor", "exploit", "bypass", "exec", "cmd", "c00l",
    "nyx", "fe", "skid", "hd", "rage", "kill", "ban", "kick", "tp",
    "teleport", "god", "esp", "aimbot", "wallhack", "fly", "noclip"
}

local dangerousFuncs = {
    "require", "loadstring", "getfenv", "setfenv", "http_request",
    "syn.request", "HttpService", "hookfunction", "newcclosure",
    "queue_on_teleport", "webhook", "discord.com/api/webhooks"
}

-- ============================================================================
-- ФУНКЦИИ СКАНИРОВАНИЯ
-- ============================================================================

function quickScan()
    print("\n========== QUICK SCAN ==========")
    local found = {}
    for _, v in ipairs(game:GetDescendants()) do
        if v:IsA("RemoteEvent") or v:IsA("RemoteFunction") then
            local name = v.Name:lower()
            for _, kw in ipairs(backdoorKeywords) do
                if name:find(kw) then
                    table.insert(found, v:GetFullName())
                    break
                end
            end
        end
    end
    
    if #found > 0 then
        for i, v in ipairs(found) do
            print("[BACKDOOR] " .. v)
        end
        notify("NYX SCANNER", "Found " .. #found .. " backdoors!", 4)
    else
        print("No backdoors found.")
    end
    print("================================\n")
    return #found
end

function deepScan()
    print("\n========== DEEP SCAN ==========")
    local found = {}
    local suspicious = {}
    
    for _, v in ipairs(game:GetDescendants()) do
        if v:IsA("RemoteEvent") or v:IsA("RemoteFunction") then
            local name = v.Name:lower()
            local parent = v.Parent and v.Parent.Name:lower() or ""
            for _, kw in ipairs(backdoorKeywords) do
                if name:find(kw) or parent:find(kw) then
                    table.insert(found, v:GetFullName())
                    break
                end
            end
        elseif v:IsA("ModuleScript") then
            local name = v.Name:lower()
            for _, kw in ipairs(backdoorKeywords) do
                if name:find(kw) then
                    table.insert(suspicious, "[Module] " .. v:GetFullName())
                    break
                end
            end
        end
    end
    
    for _, v in ipairs(found) do
        print("[BACKDOOR] " .. v)
    end
    for _, v in ipairs(suspicious) do
        print("[SUSPICIOUS] " .. v)
    end
    
    local total = #found + #suspicious
    if total > 0 then
        notify("NYX SCANNER", "Found " .. total .. " items!", 4)
    else
        print("Nothing found.")
    end
    print("===============================\n")
    return total
end

function sourceScan()
    print("\n========== SOURCE CODE SCAN ==========")
    local found = {}
    
    for _, v in ipairs(game:GetDescendants()) do
        if v:IsA("LuaSourceContainer") then
            local source = v.Source
            
            -- require(ID)
            for id in string.gmatch(source, "require%s*%(%s*(%d+)%s*%)") do
                table.insert(found, v:GetFullName() .. " -> require(" .. id .. ")")
            end
            
            -- Опасные функции
            for _, func in ipairs(dangerousFuncs) do
                if string.find(source, func) then
                    table.insert(found, v:GetFullName() .. " -> " .. func)
                end
            end
            
            -- Вебхуки
            if string.find(source, "discord%.com/api/webhooks") then
                table.insert(found, v:GetFullName() .. " -> DISCORD WEBHOOK")
            end
        end
    end
    
    if #found > 0 then
        for i, v in ipairs(found) do
            print("[CODE] " .. v)
        end
        notify("NYX SCANNER", "Found " .. #found .. " suspicious patterns!", 4)
    else
        print("No suspicious code found.")
    end
    print("======================================\n")
    return #found
end

function fullScan()
    print("\n========================================")
    print("       FULL SCAN IN PROGRESS...")
    print("========================================\n")
    
    local q = quickScan()
    local d = deepScan()
    local s = sourceScan()
    
    local total = q + d + s
    
    print("========================================")
    print("       SCAN COMPLETE!")
    print("       Total findings: " .. total)
    print("========================================")
    print("  THIS IS ADMIN EVENT, ENJOY!")
    print("========================================\n")
    
    notify("NYX SCANNER", "FULL SCAN: " .. total .. " findings!", 6)
end

-- ============================================================================
-- ФУНКЦИЯ ВЫПОЛНЕНИЯ СКРИПТОВ (ПОДДЕРЖКА require(ID))
-- ============================================================================

function executeScript(code)
    if not code or code == "" then
        print("No script to execute!")
        return
    end
    
    -- Проверяем require(ID)
    if string.find(code, "require%s*%(%s*%d+%s*%)") then
        local id = string.match(code, "require%s*%(%s*(%d+)%s*%)")
        print("\n========== REQUIRE DETECTED ==========")
        print("Module ID: " .. id)
        
        -- Пытаемся загрузить через HttpGet
        local success, httpGet = pcall(function()
            return HttpGet
        end)
        
        if success and httpGet then
            print("Loading module via HttpGet...")
            local url = "https://raw.githubusercontent.com/rohanssrao/Roblox-Modules/main/" .. id .. ".lua"
            
            pcall(function()
                local moduleCode = HttpGet(game, url)
                local func = loadstring(moduleCode)
                if func then
                    func()
                    print("Module loaded successfully!")
                    notify("NYX SCANNER", "Module " .. id .. " loaded!", 3)
                else
                    print("Failed to compile module.")
                end
            end)
        else
            print("HttpGet not available. Use this command:")
            print('loadstring(game:HttpGet("https://raw.githubusercontent.com/rohanssrao/Roblox-Modules/main/' .. id .. '.lua"))()')
        end
        print("======================================\n")
    else
        -- Обычный код
        local success, err = pcall(loadstring(code))
        if success then
            print("Script executed successfully!")
            notify("NYX SCANNER", "Script executed!", 3)
        else
            print("Error: " .. tostring(err))
        end
    end
end

-- ============================================================================
-- КОМАНДЫ ДЛЯ КОНСОЛИ
-- ============================================================================

print("========================================")
print("     NYX BACKDOOR SCANNER LOADED!")
print("========================================")
print("Commands:")
print("  quick()      - Quick scan (RemoteEvents)")
print("  deep()       - Deep scan (+ Modules)")
print("  source()     - Source code analysis")
print("  full()       - Full scan (all methods)")
print("  exec(code)   - Execute Lua code")
print("  require(id)  - Load module by ID")
print("========================================\n")

-- Глобальные функции для вызова из консоли
_G.quick = quickScan
_G.deep = deepScan
_G.source = sourceScan
_G.full = fullScan
_G.exec = executeScript
_G.require = function(id)
    executeScript("require(" .. id .. ")")
end

notify("NYX SCANNER", "Loaded! Type 'quick()' to scan.", 5)

-- Авто-определение require в поле ввода (если хочешь через UI)
print("Tip: Type exec('require(123456)') to load a module.")
