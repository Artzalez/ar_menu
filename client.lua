keys = {
  -- Letters
  ["A"] = 0x7065027D,
  ["B"] = 0x4CC0E2FE,
  ["C"] = 0x9959A6F0,
  ["D"] = 0xB4E465B4,
  ["E"] = 0xCEFD9220,
  ["F"] = 0xB2F377E8,
  ["G"] = 0x760A9C6F,
  ["H"] = 0x24978A28,
  ["I"] = 0xC1989F95,
  ["J"] = 0xF3830D8E,
  -- Missing K, don't know if anything is actually bound to it
  ["L"] = 0x80F28E95,
  ["M"] = 0xE31C6A41,
  ["N"] = 0x4BC9DABB, -- Push to talk key
  ["O"] = 0xF1301666,
  ["P"] = 0xD82E0BD2,
  ["Q"] = 0xDE794E3E,
  ["R"] = 0xE30CD707,
  ["S"] = 0xD27782E3,
  -- Missing T
  ["U"] = 0xD8F73058,
  ["V"] = 0x7F8D09B8,
  ["W"] = 0x8FD015D8,
  ["X"] = 0x8CC9CD42,
  -- Missing Y
  ["Z"] = 0x26E9DC00,

  -- Symbol Keys
  ["RIGHTBRACKET"] = 0xA5BDCD3C,
  ["LEFTBRACKET"] = 0x430593AA,
  -- Mouse buttons
  ["MOUSE1"] = 0x07CE1E61,
  ["MOUSE2"] = 0xF84FA74F,
  ["MOUSE3"] = 0xCEE12B50,
  ["MWUP"] = 0x3076E97C,
  -- Modifier Keys
  ["CTRL"] = 0xDB096B85,
  ["TAB"] = 0xB238FE0B,
  ["SHIFT"] = 0x8FFC75D6,
  ["SPACEBAR"] = 0xD9D0E1C0,
  ["ENTER"] = 0xC7B5340A,
  ["BACKSPACE"] = 0x156F7119,
  ["LALT"] = 0x8AAA0AD4,
  ["DEL"] = 0x4AF4D473,
  ["PGUP"] = 0x446258B6,
  ["PGDN"] = 0x3C3DD371,
  -- Function Keys
  ["F1"] = 0xA8E3F467,
  ["F4"] = 0x1F6D95E5,
  ["F6"] = 0x3C0A40F2,
  -- Number Keys
  ["1"] = 0xE6F612E4,
  ["2"] = 0x1CE6D9EB,
  ["3"] = 0x4F49CC4C,
  ["4"] = 0x8F9F9E58,
  ["5"] = 0xAB62E997,
  ["6"] = 0xA1FDE2A6,
  ["7"] = 0xB03A913B,
  ["8"] = 0x42385422,
  -- Arrow Keys
  ["DOWN"] = 0x05CA7C52,
  ["UP"] = 0x6319DB71,
  ["LEFT"] = 0xA65EBAB4,
  ["RIGHT"] = 0xDEB34313
}
------------------------------------------------------------------
--                          Variables
------------------------------------------------------------------

local showMenu = false                    
local toggleCoffre = 0
local toggleCapot = 0
local toggleLocked = 0
local playing_emote = false

------------------------------------------------------------------
--                          Functions
------------------------------------------------------------------

-- Show crosshair (circle) when player targets entities (vehicle, pedestrian…)
function Crosshair(enable)
  SendNUIMessage({
    crosshair = enable
  })
end

-- Toggle focus (Example of Vehcile's menu)
RegisterNUICallback('disablenuifocus', function(data)
  showMenu = data.nuifocus
  SetNuiFocus(data.nuifocus, data.nuifocus)
end)

-- Example of (Ped's menu)
RegisterNUICallback('example1', function(data)
  playerPed = GetPlayerPed(-1);
		if(not IsPedInAnyVehicle(playerPed)) then
			if playerPed then
        --ExecuteCommand("example1") Example code Here
			end
		end
end)

RegisterNUICallback('example2', function(data)
  playerPed = GetPlayerPed(-1);
		if(not IsPedInAnyVehicle(playerPed)) then
			if playerPed then
        --ExecuteCommand("example1") Example code Here
			end
		end
end)

RegisterNUICallback('example3', function(data)
  playerPed = GetPlayerPed(-1);
		if(not IsPedInAnyVehicle(playerPed)) then
			if playerPed then
        --ExecuteCommand("example1") Example code Here
			end
		end
end)

RegisterNUICallback('examplesub1', function(data)
  playerPed = GetPlayerPed(-1);
		if(not IsPedInAnyVehicle(playerPed)) then
			if playerPed then
        --ExecuteCommand("example1") Example code Here
			end
		end
end)

RegisterNUICallback('examplesub2', function(data)
  playerPed = GetPlayerPed(-1);
		if(not IsPedInAnyVehicle(playerPed)) then
			if playerPed then
        --ExecuteCommand("example1") Example code Here
			end
		end
end)


function GetEntInFrontOfPlayer(Distance, Ped)
  local Ent = nil
  local CoA = GetEntityCoords(Ped, 1)
  local CoB = GetOffsetFromEntityInWorldCoords(Ped, 0.0, Distance, 0.0)
  local RayHandle = StartShapeTestRay(CoA.x, CoA.y, CoA.z, CoB.x, CoB.y, CoB.z, -1, Ped, 0)
  local A,B,C,D,Ent = GetRaycastResult(RayHandle)
  return Ent
end

-- Camera's coords
function GetCoordsFromCam(distance)
  local rot = GetGameplayCamRot(2)
  local coord = GetGameplayCamCoord()

  local tZ = rot.z * 0.0174532924
  local tX = rot.x * 0.0174532924
  local num = math.abs(math.cos(tX))

  newCoordX = coord.x + (-math.sin(tZ)) * (num + distance)
  newCoordY = coord.y + (math.cos(tZ)) * (num + distance)
  newCoordZ = coord.z + (math.sin(tX) * 8.0)
  return newCoordX, newCoordY, newCoordZ
end

-- Get entity's ID and coords from where player sis targeting
function MTarget(Distance, Ped)
  local Entity = nil
  local camCoords = GetGameplayCamCoord()
  local farCoordsX, farCoordsY, farCoordsZ = GetCoordsFromCam(Distance)
  local RayHandle = StartShapeTestRay(camCoords.x, camCoords.y, camCoords.z, farCoordsX, farCoordsY, farCoordsZ, -1, Ped, 0)
  local A,B,C,D,Entity = GetShapeTestResult(RayHandle)
  return Entity, farCoordsX, farCoordsY, farCoordsZ
end
------------------------------------------------------------------
--                          Citizen
------------------------------------------------------------------
local SearchForMenu = false
local Efecto = "SwitchHUDIn" -- Para una nueva version

Citizen.CreateThread(function()
	while true do
    local Ped = PlayerPedId()

    -- Get informations about what user is targeting
    -- /!\ If not working, check that you have added "target" folder to resources and server.cfg
    local Entity, farCoordsX, farCoordsY, farCoordsZ = MTarget(6.0, Ped)
    local EntityType = GetEntityType(Entity)

    -- For Horse Managment
    -- If EntityType is Vehicle
    --[[
    if(EntityType == 2) then 
      if showMenu == false then
        SetNuiFocus(false, false)
      end
      Crosshair(true)

      if IsControlJustReleased(0, 0x26E9DC00) then -- E is pressed
        showMenu = true
        SetNuiFocus(true, true)
        SendNUIMessage({
          menu = 'vehicle',
          idEntity = Entity
        })
      end
      ]]--
    -- If EntityType = User
    if(EntityType == 1) then 
      if showMenu == false then
        SetNuiFocus(false, false)
      end
      Crosshair(true)

      if IsControlJustReleased(0, 0x26E9DC00) then -- E is pressed
        showMenu = true
        SetNuiFocus(true, true)
        SendNUIMessage({
          menu = 'user',
          idEntity = Entity
        })
      end
    else
      SendNUIMessage({
        menu = false
      })
      --SetNuiFocus(false, false)
      Crosshair(false)
    end

    Citizen.Wait(1)
	end
end)