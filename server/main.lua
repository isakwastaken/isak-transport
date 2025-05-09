ESX = nil

TriggerEvent("esx:getSharedObject", function(library) 
	ESX = library 
end)

RegisterServerEvent('isak-transport:teleportentity')
AddEventHandler('isak-transport:teleportentity', function(object, x, y, z)
	local xPlayers = ESX.GetPlayers()
	TriggerClientEvent('isak-transport:teleportentity', source, x, y, z)
	print('tp')
end)

function getIdentity(source, callback)
  local identifier = GetPlayerIdentifiers(source)[1]
  MySQL.Async.fetchAll("SELECT identifier, name, firstname, lastname, dateofbirth, sex, height, lastdigits FROM `users` WHERE `identifier` = @identifier",
  {
    ['@identifier'] = identifier
  },
  function(result)
    if result[1].firstname ~= nil then
      local data = {
        identifier  = result[1].identifier,
        name = result[1].name,
        firstname  = result[1].firstname,
        lastname  = result[1].lastname,
        dateofbirth  = result[1].dateofbirth,
        sex      = result[1].sex,
        height    = result[1].height,
        lastdigits = result[1].lastdigits
      }
      callback(data)
    else
      local data = {
        identifier   = '',
        name = '',
        firstname   = '',
        lastname   = '',
        dateofbirth = '',
        sex     = '',
        height     = ''
      }
      callback(data)
    end
  end)
end

RegisterServerEvent('isak-transport:GiveMoney')
AddEventHandler('isak-transport:GiveMoney', function(money)
  local player = ESX.GetPlayerFromId(source)
  getIdentity(source, function( data )
  	print(data.firstname .. ' ' .. data.lastname .. ' [' .. data.name .. '] gjorde klart Petras uppdrag. Fick en belöning på '.. money .. 'kr')
  end)
    
  player.addMoney(money)
	-- xPlayer.addMoney(money)
end)