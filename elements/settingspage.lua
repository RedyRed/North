Settings = Window:CreateTab("Settings", GearIcon)

Settings:CreateSection("Main")

local Settings = {
    HideKey = 'RightShift'
}

local function LoadSettings()
    if isfolder and readfile and isfile then
        if isfile('North/universal.nrth') then
            local Data = HttpService:JSONDecode(readfile('North/universal.nrth'))
            for i,v in pairs(Settings) do
                for i2,v2 in pairs(Data) do
                    if string.match(tostring(i), tostring(i2)) then
                        Settings[i] = v2
                    end
                end
            end
        end
    end
end
local function SaveSettings()
    if not isfolder('North') then
        makefolder('North')
    end
    local Data = HttpService:JSONEncode(Settings)
    writefile('North/universal.nrth', Data)
end

LoadSettings()

local KeybindKey = Settings.HideKey
Settings:CreateKeybind({
    Name = "Hide GUI Key",
    CurrentKeybind = KeybindKey,
    HoldToInteract = false,
    Flag = nil,
    Callback = function()
        if RayfieldUI.Main.Visible then
            Hide()
        else
            Unhide()
        end
    end
})

spawn(function()
    while wait() do
        if KeybindKey ~= Settings.HideKey then
            Settings.HideKey = KeybindKey
            SaveSettings()
        end
    end
end)