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
loadstring(game:HttpGet('https://raw.githubusercontent.com/RedyRed/North/main/elements/framework'))()
Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/RedyRed/Rayfield-Custom/main/source'))()
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
        Rayfield:Notify({
            Title = "North Hub",
            Content = 'WARNING: The game has been updated '..math.floor(diff)..' hours ago, which means that some functions may be patched by now. Are you sure you want to proceed?',
            Duration = 300,
            Image = 2804603863,
            Actions = {
                x = {
                    Name = 'Yes',
                    Callback = function() 
                        loadstring(game:HttpGet(url))()
                    end
                },
                y = {
                    Name = 'No',
                    Callback = function()
                        return
                    end
                }
             }
        })
    else
        loadstring(game:HttpGet(url))()
    end
else
    loadstring(game:HttpGet('https://raw.githubusercontent.com/RedyRed/North/main/universal'))()
end