Tab = Window:CreateTab("Home", HomeIcon)

Tab:CreateSection("Status")
local Welcome =
    Tab:CreateParagraph(
    {
        Title = "Game Supported",
        Content = tostring((Universal and false) or (not Universal and false))
    }
)

Tab:CreateSection("Main")
local Welcome =
    Tab:CreateParagraph(
    {
        Title = "Welcome, " .. game:GetService("Players").LocalPlayer.DisplayName,
        Content = ("Place: %s\nPlaceId: %i"):format(GameName, game.PlaceId)
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

Tab:CreateSection("Updates Log")

Tab:CreateParagraph({Title = "Changes", Content = table.concat(Changes, ",\n")})
Tab:CreateParagraph({Title = "Added", Content = table.concat(Added, ",\n")})
Tab:CreateParagraph({Title = "Removed", Content = table.concat(Removed, ",\n")})

Tab:CreateSection("Credits")
Tab:CreateParagraph({Title = "RVZ", Content = "Owner of the North Project"})
Tab:CreateParagraph({Title = "VisOn", Content = "Co-Owner & Mainly Helper"})
Tab:CreateSection("Discord")
Tab:CreateButton(
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
