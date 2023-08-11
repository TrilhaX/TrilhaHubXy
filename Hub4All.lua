local repo = "https://raw.githubusercontent.com/TrilhaX/TrilhaHubXy/main/Main"
local function LoadScript(ScriptName)
	pcall(function()
		t = 0
		repeat
			local s, r = pcall(function()
				loadstring(game:HttpGet(repo .. ScriptName))()
			end)
			if not s then
				spawn(function()
					error(r)
				end)
			end
			t = t + 1
			wait(60)
		until getgenv().Executed or t >= 30
	end)
end
local Id = game.PlaceId
local GameId = game.GameId
local PlaceIds = {
	['AFSX(Normal)'] = {11545598432},
	['AFSX(Tournament)'] = {14400427869},
	['PM'] = {10202329527},
	['ADV'] = {8304191830},
	['AFS'] = {6299805723},
}
if table.find(PlaceIds['AFSX(Normal)'], GameId) then -- AFSX
	LoadScript("AFSX(NORMAL).lua")
elseif table.find(PlaceIds['AFSX(Tournament)'], GameId) then -- AFSX
	LoadScript("AFSX(TORNEIO).lua")
elseif table.find(PlaceIds['PM'], GameId) then -- PM
	LoadScript("PM.lua")
elseif table.find(PlaceIds['ADV'], GameId) then -- ADV
	LoadScript("adv.lua")
elseif table.find(PlaceIds['AFS'], GameId) then -- AFS
	LoadScript("afs.lua")
end