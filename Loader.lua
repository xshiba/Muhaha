_G.LoadNew = true
task.spawn(function()
    repeat
        task.wait(1)
    until game.Players.LocalPlayer.Character and game.Players.LocalPlayer:GetAttribute("DataLoaded") and game.Players.LocalPlayer:GetAttribute("ExitedFromBox")
    

    task.wait(5)

    local function in_ac_stack()
        if debug.getinfo(4).source and debug.getinfo(4).source:match('0B3HQ41JY') then
            return true
        end
        return false
    end
    local ACsrc = nil
    local yield = false
    local old = getrenv().getfenv
    hookfunction(getrenv().getfenv, function(...)
        if not in_ac_stack() or checkcaller() or yield then return old(...) end
        print(debug.info(2, 's'))
        return coroutine.yield()
    end)

    task.spawn(pcall,function()
        local ScriptContext = game:GetService("ScriptContext")
        for i, v in next, getconnections(ScriptContext.Error) do
            v:Disable()
        end
        for i, v in next, getgc() do
            if typeof(v) == "function" and islclosure(v) then
                for _, constant in next, debug.getconstants(v) do
                    if constant == "4503599627370495" then
                        hookfunction(v, function() end)
                        warn("hooked")
                        break
                    end
                end
            end
        end
    end)
end)
loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/16ddf2948fdb2a2791df613f2b969e7c.lua"))()
