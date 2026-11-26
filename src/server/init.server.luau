local ServerStorage = game:GetService("ServerStorage")
function summonButton(position:Vector3):Instance
    local newButton = ServerStorage.ButtonModel:Clone()
    newButton.Parent = workspace
    newButton:PivotTo(CFrame.new(position + Vector3.new(0, newButton.BasePart.Size.Y / 2, 0)))

    return newButton
end

summonButton(Vector3.new(10, 0, 10))
summonButton(Vector3.new(-10, 0, 10))
summonButton(Vector3.new(10, 0, -10))
summonButton(Vector3.new(-10, 0, -10))