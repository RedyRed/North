-- Variables
Players = game:GetService('Players')
Player = Players.LocalPlayer
UserInputService = game:GetService('UserInputService')
TweenService = game:GetService('TweenService')
CoreGui = game:GetService('CoreGui')
MarketplaceService = game:GetService('MarketplaceService')
HttpService = game:GetService('HttpService')
RunService = game:GetService('RunService')

-- Functions
function root(x)
    if typeof(x) == 'string' then
        x = Players:FindFirstChild(x) and Players[x].Character
    end
    x = x or Player.Character
    return x and x:FindFirstChild('HumanoidRootPart')
end
function humanoid(x)
    if typeof(x) == 'string' then
        x = Players:FindFirstChild(x) and Players[x].Character
    end
    x = x or Player.Character
    return x and x:FindFirstChild('Humanoid')
end
function char(x)
    if typeof(x) == 'string' then
        x = Players:FindFirstChild(x) and Players[x].Character
    end
    x = x or Player.Character
    return x
end
function getNil(name, classname)
    if getnilinstances then
        local instance
        for i,v in pairs(getnilinstances()) do
            if v.Name == tostring(name) and v.ClassName == tostring(classname) then
                instance = v
                break
            end
        end
        return instance
    else
        return
    end
end

-- Icons
HomeIcon = 11396131982
CubeIcon = 4483362458
ShieldIcon = 7169354142
SwordIcon = 7485051715
GearIcon = 7059346373
LockIcon = 3523247585
RunIcon = 9525535512
SoundIcon = 7203392850
SoundOffIcon = 11488028230
StarIcon = 3057073083
PlayerIcon = 2795572800
SearchIcon = 2804603863
MusicIcon = 7059338404
CrownIcon = 11322089611
HammerIcon = 10885640682
DollarIcon = 6908632622
EyeIcon = 6523858394
TimerIcon = 6761866149
RebirthIcon = 2238767564
InformationIcon = 4871684504
PlayersIcon = 11577689639
ScriptIcon = 11348555035
WarningIcon = 11745872910
AmmoIcon = 6011908706
FriendIcon = 10885655986
TeleportIcon = 6723742952
