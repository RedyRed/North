SettingsTab = Window:CreateTab("Settings", GearIcon)

SettingsTab:CreateSection("Main")

local Settings = {
    HideKey = 'RightShift',
}

local function LoadSettings()
    if isfolder and readfile and isfile then
        if isfile('North/main.nrth') then
            local Data = HttpService:JSONDecode(readfile('North/main.nrth'))
            for i,v in pairs(Settings) do
                for i2,v2 in pairs(Data) do
                    if string.match(tostring(i), tostring(i2)) and v2 ~= nil then
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
    writefile('North/main.nrth', Data)
end

LoadSettings()

local KeybindKey = Settings.HideKey
SettingsTab:CreateKeybind({
    Name = "Hide GUI Key",
    CurrentKeybind = KeybindKey,
    HoldToInteract = false,
    Flag = nil,
    Callback = function()
        if Debounce then return end
	    if Hidden then
		    Hidden = false
		    Minimised = false
		    Unhide()
	    else
		    Hidden = true
		    Hide()
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