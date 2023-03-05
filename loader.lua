n=[[
          _____                   _______                   _____                _____                    _____                            _____                    _____                    _____          
         /\    \                 /::\    \                 /\    \              /\    \                  /\    \                          /\    \                  /\    \                  /\    \         
        /::\____\               /::::\    \               /::\    \            /::\    \                /::\____\                        /::\____\                /::\____\                /::\    \        
       /::::|   |              /::::::\    \             /::::\    \           \:::\    \              /:::/    /                       /:::/    /               /:::/    /               /::::\    \       
      /:::::|   |             /::::::::\    \           /::::::\    \           \:::\    \            /:::/    /                       /:::/    /               /:::/    /               /::::::\    \      
     /::::::|   |            /:::/~~\:::\    \         /:::/\:::\    \           \:::\    \          /:::/    /                       /:::/    /               /:::/    /               /:::/\:::\    \     
    /:::/|::|   |           /:::/    \:::\    \       /:::/__\:::\    \           \:::\    \        /:::/____/                       /:::/____/               /:::/    /               /:::/__\:::\    \    
   /:::/ |::|   |          /:::/    / \:::\    \     /::::\   \:::\    \          /::::\    \      /::::\    \                      /::::\    \              /:::/    /               /::::\   \:::\    \   
  /:::/  |::|   | _____   /:::/____/   \:::\____\   /::::::\   \:::\    \        /::::::\    \    /::::::\    \   _____            /::::::\    \   _____    /:::/    /      _____    /::::::\   \:::\    \  
 /:::/   |::|   |/\    \ |:::|    |     |:::|    | /:::/\:::\   \:::\____\      /:::/\:::\    \  /:::/\:::\    \ /\    \          /:::/\:::\    \ /\    \  /:::/____/      /\    \  /:::/\:::\   \:::\ ___\ 
/:: /    |::|   /::\____\|:::|____|     |:::|    |/:::/  \:::\   \:::|    |    /:::/  \:::\____\/:::/  \:::\    /::\____\        /:::/  \:::\    /::\____\|:::|    /      /::\____\/:::/__\:::\   \:::|    |
\::/    /|::|  /:::/    / \:::\    \   /:::/    / \::/   |::::\  /:::|____|   /:::/    \::/    /\::/    \:::\  /:::/    /        \::/    \:::\  /:::/    /|:::|____\     /:::/    /\:::\   \:::\  /:::|____|
 \/____/ |::| /:::/    /   \:::\    \ /:::/    /   \/____|:::::\/:::/    /   /:::/    / \/____/  \/____/ \:::\/:::/    /          \/____/ \:::\/:::/    /  \:::\    \   /:::/    /  \:::\   \:::\/:::/    / 
         |::|/:::/    /     \:::\    /:::/    /          |:::::::::/    /   /:::/    /                    \::::::/    /                    \::::::/    /    \:::\    \ /:::/    /    \:::\   \::::::/    /  
         |::::::/    /       \:::\__/:::/    /           |::|\::::/    /   /:::/    /                      \::::/    /                      \::::/    /      \:::\    /:::/    /      \:::\   \::::/    /   
         |:::::/    /         \::::::::/    /            |::| \::/____/    \::/    /                       /:::/    /                       /:::/    /        \:::\__/:::/    /        \:::\  /:::/    /    
         |::::/    /           \::::::/    /             |::|  ~|           \/____/                       /:::/    /                       /:::/    /          \::::::::/    /          \:::\/:::/    /     
         /:::/    /             \::::/    /              |::|   |                                        /:::/    /                       /:::/    /            \::::::/    /            \::::::/    /      
        /:::/    /               \::/____/               \::|   |                                       /:::/    /                       /:::/    /              \::::/    /              \::::/    /       
        \::/    /                 ~~                      \:|   |                                       \::/    /                        \::/    /                \::/____/                \::/____/        
         \/____/                                           \|___|                                        \/____/                          \/____/                  ~~                       ~~              
                                                                                                                                                                                                            
]]

----------------------------------------

Changes = {}
Added = {'Updated ZO'}
Removed = {}

Release = '1.1.0'
Invite = 'MPZWtKxEcQ'

pcall(function()
    GameName = game:GetService('MarketplaceService'):GetProductInfo(game.PlaceId).Name 
end)

--------------Framework & Library-----------------
loadstring(game:HttpGet('https://raw.githubusercontent.com/RedyRed/North/main/elements/framework.lua'))()
Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/RedyRed/Rayfield-Custom/main/source.lua'))()
----------------------------------------

if Debug then return end

local url = 'https://raw.githubusercontent.com/RedyRed/North/main/Games/'..game.PlaceId

if pcall(function()
    game:HttpGet(url)
end) then
    local updSec = tonumber(tostring(DateTime.fromIsoDate(game.MarketplaceService:GetProductInfo(game.PlaceId).Updated)))
    local current = tonumber(tostring(DateTime.now()))

    local diff = (current-updSec)/1000/60/60
    if diff <= 24 then
        local bindable = Instance.new("BindableFunction")
        function bindable.OnInvoke(response)
            if response == "Yes" then
                loadstring(game:HttpGet(url))()
            end
        end
        game.StarterGui:SetCore("SendNotification",{
            Title = 'North Hub',
            Text = 'WARNING: The game has been updated '..diff..' hours ago. Proceed?',
            Duration = 300,
            Icon = 'rbxassetid://12660955323',
            Callback = bindable,
            Button1 = 'Yes',
            Button2 = 'No'
        })
    else
        loadstring(game:HttpGet(url))()
    end
else
    loadstring(game:HttpGet('https://raw.githubusercontent.com/RedyRed/North/main/universal'))()
end
