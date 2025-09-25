-- avatarHandler.lua (Super Compatible)
local module = {}

-- helper function: cari part terdekat dengan nama
local function findPart(char, names)
    for _, name in ipairs(names) do
        local part = char:FindFirstChild(name)
        if part then return part end
    end
    -- fallback: ambil part pertama yang punya Position
    for _, obj in ipairs(char:GetChildren()) do
        if obj:IsA("BasePart") then return obj end
    end
    return nil
end

function module.getAvatarInfo(char)
    local humanoid = char:FindFirstChildOfClass("Humanoid")
    if not humanoid then
        warn("Humanoid not found!")
        return nil
    end

    -- deteksi rig type
    local rigType = "R6"
    if char:FindFirstChild("UpperTorso") then
        rigType = "R15"
    end

    -- cari torso/HRP
    local hrp = char:FindFirstChild("HumanoidRootPart") or findPart(char, {"HumanoidRootPart", "Torso", "UpperTorso"})
    local torso = findPart(char, {"UpperTorso", "Torso", "RootPart"}) or hrp

    -- scaling
    local scale = 1
    local heightScale = humanoid:FindFirstChild("BodyHeightScale")
    if heightScale then scale = heightScale.Value end

    local width = humanoid:FindFirstChild("BodyWidthScale") and humanoid.BodyWidthScale.Value or 1
    local depth = humanoid:FindFirstChild("BodyDepthScale") and humanoid.BodyDepthScale.Value or 1

    return {
        humanoid = humanoid,
        hrp = hrp,
        torso = torso,
        rigType = rigType,
        scale = scale,
        width = width,
        depth = depth
    }
end

return module
