local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local gui = script.Parent.Parent:WaitForChild("PlayerGui"):WaitForChild("MainGui")

gui.DialogueBox.Visible = false

function showDialogueUi()
    gui.DialogueBox.Visible = true
    gui.DialogueBox:TweenPosition(
        UDim2.new(0.5, 0, 0.85, 0),
		Enum.EasingDirection.Out,
		Enum.EasingStyle.Sine,
		0.25,
		true
    )
    gui.DialogueBox:TweenSize(
        UDim2.new(0.4, 0, 0.25, 0),
		Enum.EasingDirection.Out,
		Enum.EasingStyle.Back,
		0.25,
		true
    )
end

function hideDialogueUi()
    gui.DialogueBox:TweenPosition(
        UDim2.new(0.5, 0, 1.2, 0),
		Enum.EasingDirection.Out,
		Enum.EasingStyle.Sine,
		0.25,
		true
    )
    gui.DialogueBox:TweenSize(
        UDim2.new(0.6, 0, 0.15, 0),
		Enum.EasingDirection.Out,
		Enum.EasingStyle.Quad,
		0.25,
		true,
        function()
            gui.DialogueBox.Visible = false
        end
    )
end

local previousValue = 0

gui.DialogueBox.TextVisibility.Changed:Connect(function(value)
    gui.DialogueBox.Title.MaxVisibleGraphemes = math.round(value)
    if math.round(value) ~= previousValue then
        ReplicatedStorage.Sounds.DialogueBeep.PlaybackSpeed = 0.8 + math.random() * 0.4
        ReplicatedStorage.Sounds.DialogueBeep:Play()
    end
    previousValue = math.round(value)
end)

function printDialogue(text:string, name:string, duration:number, speed:number, char:Instance?)
    gui.DialogueBox.Title.Text = text
    gui.DialogueBox.NameBox.Title.Text = name
    gui.DialogueBox.Title.MaxVisibleGraphemes = 0
    
    showDialogueUi()

    TweenService:Create(gui.DialogueBox.TextVisibility, TweenInfo.new(text:len() / speed, Enum.EasingStyle.Linear), {Value = text:len()}):Play()
    task.wait(duration)

    hideDialogueUi()
end

task.wait(5)

printDialogue("HelloWorld", "TestName", 5, 30)