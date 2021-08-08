ESX = nil
local PlayerData = {}


RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer 
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)



  
RegisterCommand("warzone",function()
  
  local blips = {
    -- Example {title="", colour=, id=, x=, y=, z=},

     {title="warzone point", colour=1, id=148, x = 1730.94, y = 3312.54, z = 41.22}
  
  }
  ---هون بنعمل الرسمة على الخريطة
  Citizen.CreateThread(function()
    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 10.0)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
  end)
  function getmoney()
    TriggerServerEvent('player:money')
  end
  while true do
    Citizen.Wait(10000)
   local coords = GetEntityCoords(PlayerPedId()) 
   if GetDistanceBetweenCoords(coords,1730.94,3312.54,41.22, true) < 50 then
       TriggerEvent('chat:addMessage', {
       color = { 255, 0, 0},
       multiline = true,
        args = {"Me", "Nice enjoy the money m8 !"}
      })
      getmoney()
    end 
  end
end)


