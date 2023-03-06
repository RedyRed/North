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
Added = {'Updated ZO', 'Added Home', 'Added Settings'}
Removed = {}

Release = '1.1.0'
Invite = 'MPZWtKxEcQ'

pcall(function()
    GameName = game:GetService('MarketplaceService'):GetProductInfo(game.PlaceId).Name 
end)

--------------Framework-----------------
ManualHide = true
loadstring(game:HttpGet('https://raw.githubusercontent.com/RedyRed/North/main/elements/framework.lua'))()
----------------------------------------

if Debug then return end

local url = 'https://raw.githubusercontent.com/RedyRed/North/main/Games/'..game.PlaceId

if pcall(function()
    game:HttpGet(url)
end) or pcall(function()
    url = 'https://raw.githubusercontent.com/RedyRed/North/main/Games/'..game.GameId
    game:HttpGet(url)
end) then
    local updSec = tonumber(tostring(DateTime.fromIsoDate(game.MarketplaceService:GetProductInfo(game.PlaceId).Updated)))
    local current = tonumber(tostring(DateTime.now()))

    local diff = (current-updSec)/1000/60/60
    if diff <= 24 then
        if hookfunction then -- Anti GUI Detection
            hookfunction(game:GetService("ContentProvider").PreloadAsync, function()
                return nil
            end)
        else
            warn('Error: Incapable exploit! (hookfunction missing)')
            return
        end

        local bindable = Instance.new("BindableFunction")
        function bindable.OnInvoke(response)
            if response == "Yes" then
                loadstring(game:HttpGet(url))()
            end
        end
        game.StarterGui:SetCore("SendNotification",{
            Title = 'North Hub',
            Text = 'WARNING: The game was updated '..math.floor(diff)..' hours ago. Proceed?',
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
    Universal = true
    loadstring(game:HttpGet('https://raw.githubusercontent.com/RedyRed/North/main/universal'))()
end
