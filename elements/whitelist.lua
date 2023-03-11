Whitelist = Window:CreateTab('Whitelist', PlayersIcon)

Whitelisted = {}

function CheckWl(plr)
    plr = ((plr:IsA('Player') or plr:IsA('Model')) and plr.Name) or plr
    return table.find(Whitelisted, plr)
end

local wls
function UpdateList()
    wls:Set({Title = "Whitelist", Content = table.concat(Whitelisted, ', ')})
end

function RemoveWl(plr, update)
    plr = ((plr:IsA('Player') or plr:IsA('Model')) and plr.Name) or plr
    if CheckWl(plr) then
        table.remove(Whitelisted, table.find(Whitelisted, plr))
    end
    if update then
        UpdateList()
    end
end
function AddWl(plr, update)
    plr = ((plr:IsA('Player') or plr:IsA('Model')) and plr.Name) or plr
    if not CheckWl(plr) then
        table.insert(Whitelisted, plr)
    end
    if update then
        UpdateList()
    end
end

Whitelist:CreateSection('Whitelist Information')
Whitelist:CreateParagraph({Title = 'Info', Content = 'Some functions may have "NW" tag, this means they will not work on whitelisted players'})

Whitelist:CreateSection('Manipulate Whitelist')

Whitelist:CreateInput({
    Name = "Whitelist/Blacklist",
    PlaceholderText = "Username",
    RemoveTextAfterFocusLost = true,
    Callback = function(Text)
        for i,v in pairs(Players:GetPlayers()) do
            if Text ~= '' and (v.Name:sub(1, #Text):lower() == Text:lower() or v.DisplayName:sub(1, #Text):lower() == Text:lower()) and v.Name ~= Player.Name then
                if table.find(Whitelisted, v.Name) then
                    table.remove(Whitelisted, table.find(Whitelisted, v.Name))
                    UpdateList()
                    Rayfield:Notify({
                        Title = "Blacklist",
                        Content = "Successfully removed user from whitelist: "..tostring(v.Name),
                        Duration = 4,
                        Image = 4483362458,
                    })
                else
                    table.insert(Whitelisted, v.Name)
                    UpdateList()
                    Rayfield:Notify({
                        Title = "Whitelist",
                        Content = "Successfully added user to whitelist: "..tostring(v.Name),
                        Duration = 4,
                        Image = 4483362458,
                    })
                end
                break
            end
        end
    end,
})
Whitelist:CreateInput({
    Name = "Check Whitelist",
    PlaceholderText = "Username",
    RemoveTextAfterFocusLost = true,
    Callback = function(Text)
        for i,v in pairs(Players:GetPlayers()) do
            if Text ~= '' and (v.Name:sub(1, #Text):lower() == Text:lower() or v.DisplayName:sub(1, #Text):lower() == Text:lower()) and v.Name ~= Player.Name then
                Rayfield:Notify({
                    Title = "Whitelist",
                    Content = v.Name.."\'s Whitelist status: "..tostring((table.find(Whitelisted, v.Name) and true) or false),
                    Duration = 4,
                    Image = 4483362458,
                })
            end
        end
    end,
})

Whitelist:CreateSection('Whitelisted Players')

wls = Whitelist:CreateParagraph({Title = "Whitelist", Content = ""})

Players.PlayerRemoving:connect(function(plr)
    if table.find(Whitelisted, plr.Name) then
        table.remove(Whitelisted, table.find(Whitelisted, plr.Name))
        UpdateList()
    end
end)

Whitelist:CreateButton({
    Name = "Clear Whitelist",
    Callback = function()
        Whitelisted = {}
        UpdateList()
        Rayfield:Notify({
            Title = "Whitelist",
            Content = 'Whitelist has been cleared',
            Duration = 3,
            Image = 4483362458,
        })
    end
})
