Whitelist = Window:CreateTab('Whitelist', PlayersIcon)

Whitelisted = {}

Whitelist:CreateSection('Whitelist Information')
Whitelist:CreateParagraph({Title = 'Info', Content = 'Some functions may have "NW" tag, this means they will not work on whitelisted players'})

Whitelist:CreateSection('Manipulate Whitelist')

local wls
Whitelist:CreateInput({
    Name = "Whitelist/Blacklist",
    PlaceholderText = "Username",
    RemoveTextAfterFocusLost = true,
    Callback = function(Text)
        for i,v in pairs(game.Players:GetPlayers()) do
            if Text ~= '' and (v.Name:sub(1, #Text):lower() == Text:lower() or v.DisplayName:sub(1, #Text):lower() == Text:lower()) and v.Name ~= plr.Name then
                if table.find(Whitelisted, v.Name) then
                    table.remove(Whitelisted, table.find(Whitelisted, v.Name))
                    wls:Set({Title = "Whitelist", Content = table.concat(Whitelisted, ', ')})
                    Rayfield:Notify({
                        Title = "Blacklist",
                        Content = "Successfully removed user from whitelist: "..tostring(v.Name),
                        Duration = 4,
                        Image = 4483362458,
                    })
                else
                    table.insert(Whitelisted, v.Name)
                    wls:Set({Title = "Whitelist", Content = table.concat(Whitelisted, ', ')})
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
        for i,v in pairs(game.Players:GetPlayers()) do
            if Text ~= '' and (v.Name:sub(1, #Text):lower() == Text:lower() or v.DisplayName:sub(1, #Text):lower() == Text:lower()) and v.Name ~= plr.Name then
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
        wls:Set({Title = "Whitelist", Content = table.concat(Whitelisted, ', ')})
    end
end)

Whitelist:CreateButton({
    Name = "Clear Whitelist",
    Callback = function()
        Whitelisted = {}
        wls:Set({Title = "Whitelist", Content = table.concat(Whitelisted, ', ')})
        Rayfield:Notify({
            Title = "Whitelist",
            Content = 'Whitelist has been cleared',
            Duration = 3,
            Image = 4483362458,
        })
    end
})
