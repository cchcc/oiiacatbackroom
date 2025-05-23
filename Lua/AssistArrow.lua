﻿local ReplicatedStorage = game:GetService("ReplicatedStorage")
local G = require(ReplicatedStorage.G)
local AssistOffEvent = ReplicatedStorage:WaitForChild("AssistOffEvent")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local humanoidRootPart = player.Character.HumanoidRootPart
local character = player.Character
local humanoid = character.Humanoid
local characterSize = humanoidRootPart.Size
local characterPos = humanoidRootPart.Position


--local target = workspace.ReadyZone.ReadyZone.Touch

local target = load(script:GetAttribute(G.SCRIPT))()
local connection
connection = RunService.RenderStepped:Connect(function()
	local arrow = humanoidRootPart.AssistArrow
	local targetPosition = target.Position
	
    if character and arrow and targetPosition then
        local arrowPosition = arrow.PrimaryPart.Position
        

        -- 목표 방향 벡터 계산
        local direction = (targetPosition - arrowPosition).unit
        
        -- 화살표의 CFrame을 방향 벡터로 조정
        arrow.PrimaryPart.CFrame = CFrame.new(arrowPosition, arrowPosition + direction)
    else
		connection:Disconnect()
		AssistOffEvent:Fire()
    end
    
end)