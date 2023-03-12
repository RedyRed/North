HomeTab = Window:CreateTab("Home", HomeIcon)

HomeTab:CreateSection("Main")
local Welcome =
    HomeTab:CreateParagraph(
    {
        Title = "Welcome, " .. game:GetService("Players").LocalPlayer.DisplayName,
        Content = ("Place: %s\nPlaceId: %i"):format(GameName, game.PlaceId)
    }
)
HomeTab:CreateParagraph(
    {
        Title = "Status:",
        Content = 'Script Version: '..Release..'\nGame Supported: '..tostring((Universal and false) or (not Universal and false))..((getgenv().NorthDebug and '\nDebug Mode: true') or '')
    }
)
spawn(
    function()
        while wait() do
            local Runtime = workspace.DistributedGameTime
            local Minutes = math.floor(Runtime / 60)
            local Hours = math.floor(Minutes / 60)
            local Seconds = math.floor(Runtime % 60)
            Welcome:Set(
                {
                    Title = "Welcome, " .. game:GetService("Players").LocalPlayer.Name,
                    Content = ("Place: %s\nPlaceId: %i\nRun Time: %02i:%02i:%02i"):format(
                        GameName,
                        game.PlaceId,
                        Hours,
                        Minutes,
                        Seconds
                    )
                }
            )
        end
    end
)

HomeTab:CreateSection("Updates Log")

HomeTab:CreateParagraph({Title = "Changes", Content = table.concat(Changes, ",\n")})
HomeTab:CreateParagraph({Title = "Added", Content = table.concat(Added, ",\n")})
HomeTab:CreateParagraph({Title = "Removed", Content = table.concat(Removed, ",\n")})

HomeTab:CreateSection("Credits")
HomeTab:CreateParagraph({Title = "RVZ", Content = "Owner of the North Project"})
HomeTab:CreateParagraph({Title = "VisOn", Content = "Co-Owner & Mainly Helper"})
HomeTab:CreateSection("Discord")
HomeTab:CreateButton(
    {
        Name = "discord.gg/MPZWtKxEcQ (click to copy)",
        Callback = function()
            if setclipboard then
                setclipboard("https://discord.gg/MPZWtKxEcQ")
                Rayfield:Notify(
                    {
                        Title = "Discord Invite",
                        Content = "Successfully copied to clipboard",
                        Duration = 3,
                        Image = 4483362458
                    }
                )
            else
                Rayfield:Notify(
                    {
                        Title = "Discord Invite",
                        Content = "Failed to copy to clipboard (setclipboard missing)",
                        Duration = 3,
                        Image = 4483362458
                    }
                )
            end
        end
    }
)
