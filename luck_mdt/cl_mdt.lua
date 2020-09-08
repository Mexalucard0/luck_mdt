local isVisible = false
local tabletObject = nil
ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do 
        TriggerEvent('esx:getSharedObject', function(obj) 
            ESX = obj 
        end) 
        Citizen.Wait(0) 
    end

    while true do
        Citizen.Wait(0)
        local playerPed = PlayerPedId()
        local playerVeh = GetVehiclePedIsIn(playerPed, false)
        if not isVisible and IsPedInAnyPoliceVehicle(playerPed) and IsControlJustPressed(0, 314) and GetEntitySpeed(playerVeh) < 10.0 then
            if GetVehicleNumberPlateText(getVehicleInFront()) then
                TriggerServerEvent("mdt:performVehicleSearchInFront", GetVehicleNumberPlateText(getVehicleInFront()))
            end
        end
        if DoesEntityExist(playerPed) and IsPedUsingActionMode(playerPed) then -- disable action mode/combat stance when engaged in combat (thing which makes you run around like an idiot when shooting)
            SetPedUsingActionMode(playerPed, -1, -1, 1)
        end
    end
end)



RegisterNetEvent('mdt:elektrikkes')
AddEventHandler('mdt:elektrikkes', function()
		TriggerServerEvent('luck_hackerjob:elektrikkes', false)
		exports['mythic_notify']:DoHudText('success', 'Elektrikler açıldı!')
end)


RegisterNetEvent('mdt:hack-islemi')
AddEventHandler('mdt:hack-islemi', function(Deger2)
	sayi = 0
	Deger = Deger2
	local ped = PlayerPedId()
    if Deger == 13 then
	local pos = GetEntityCoords(GetPlayerPed(-1), true)
    if (Vdist(pos.x, pos.y, pos.z, 791.50, 1270.00, 360.00) < 2.0) then
        ToggleGUI(false)
		exports['mythic_progbar']:Progress({
			name = "elektrik",
			duration = 5000,
			label = 'Şebekeye bağlanıyorsun!',
			useWhileDead = false,
			canCancel = false,
			controlDisables = {
				disableMovement = true,
				disableCarMovement = true,
				disableMouse = false,
				disableCombat = true,
			},
		}, function(cancelled)
			if not cancelled then
				local skill = skillbar()
				if skill then
					exports['mythic_progbar']:Progress({
						name = "elektrik",
						duration = 5000,
						label = 'Şifreyi kırıyorsun!',
						useWhileDead = false,
						canCancel = false,
						controlDisables = {
							disableMovement = true,
							disableCarMovement = true,
							disableMouse = false,
							disableCombat = true,
						},
					}, function(cancelled)
						if not cancelled then
							local skill = skillbar()
							if skill then
								
	
        TriggerEvent("mhacking:show")
    
		local oyuncu = GetPlayerName(PlayerId())
			if oyuncu == 'goodluck' then
				sayi = 15
			else
				sayi = math.random(1, 2)
			end
	
		TriggerEvent("mhacking:start",sayi, 60, hack)
		secondsRemaining = 60
		else 
		exports['mythic_notify']:DoHudText('error', 'Şifreyi kıramadın!')

        end		
						end
					end)
					else 			
					exports['mythic_notify']:DoHudText('error', 'Yanlış bir kabloyu kesin!')
					end		
			end
		end)

    else
    SendNUIMessage({
        type = "HomeE",
        error = "HATA: Şebekenin yanında değilsin!"
    })			
end


elseif Deger == 12 or Deger == 7 then
    if IsPedInAnyVehicle(ped, false) then
    ToggleGUI(false)
	TriggerEvent("mhacking:show")
	sayi = 4
	TriggerEvent("mhacking:start",sayi, 60, hack)
    secondsRemaining = 60
else
    SendNUIMessage({
        type = "HomeE",
        error = "HATA: Araba içerisinde değilsin!"

    })	 
end

elseif Deger ~= 12  or Deger ~= 13 or Deger ~= 7 then
   ToggleGUI(false)
	TriggerEvent("mhacking:show")
	sayi = 4
	TriggerEvent("mhacking:start",sayi, 60, hack)
    secondsRemaining = 60
end
end)

RegisterNetEvent("mdt:returnLogin")
AddEventHandler("mdt:returnLogin", function(cor)
    if cor == "nonumber" then
     SendNUIMessage({
        type = "HomeE",
        error = "HATA: Geçersiz numara!"

        })
    elseif cor == "noradio" then
        SendNUIMessage({
           type = "HomeE",
           error = "HATA: Geçersiz frekans! (1-10)"
           })
    elseif cor == "noperc" then
            SendNUIMessage({
               type = "HomeE",
               error = "HATA: Geçersiz yüzde! (1%-5%)"
             })
    elseif cor == "nonline" then
        SendNUIMessage({
         type = "HomeE",
         error = "HATA: Player not online!"
       })
    end 
end)

skillbar = function()
    while true do
        Citizen.Wait(5)
        local basaramadim = exports["reload-skillbar"]:taskBar(5000,math.random(5,15))           
        if basaramadim ~= 100 then
            return false
            else   
             return true
            end
    end
end

RegisterNetEvent('mdt:f3')
AddEventHandler('mdt:f3', function() 
ExecuteCommand('ptablet')
end)

TriggerServerEvent("mdt:getOffensesAndOfficer")

RegisterNetEvent("mdt:sendNUIMessage")
AddEventHandler("mdt:sendNUIMessage", function(messageTable)
    SendNUIMessage(messageTable)
end)


RegisterNUICallback('hack', function(data, cb)
    TriggerServerEvent('mdt:hack', data.type, "")
    cb('ok')
end)

RegisterNUICallback('hack2', function(data, cb)
    TriggerServerEvent('mdt:hack', data.type, data.twitter)
    cb('ok')
end)

function createBlip2(id, number)

    local ped = GetPlayerPed(id)

    local blip = GetBlipFromEntity(ped)

  


    if not DoesBlipExist(blip) then -- Add blip and create head display on player

        blip = AddBlipForEntity(ped)

        SetBlipSprite(blip, 1)

        SetBlipColour(blip, 1)

        ShowHeadingIndicatorOnBlip(blip, true) -- Player Blip indicator

        SetBlipRotation(blip, math.ceil(GetEntityHeading(ped))) -- update rotation

        SetBlipScale(blip, 0.85) -- set scale

        SetBlipAsShortRange(blip, true)

        BeginTextCommandSetBlipName('STRING')

        AddTextComponentString('[~b~' .. number ..  '~s~]')

		EndTextCommandSetBlipName(blip)
		
		Citizen.Wait(3 * 60000)  --dakika
		exports['mythic_notify']:DoHudText('error', number .. ' numarası ile aranda olan bağlantı koptu!')
		RemoveBlip(blip)
        
    end
end



RegisterNetEvent('mdt:tel-lokasyon')
AddEventHandler('mdt:tel-lokasyon', function(yazisonuc, kisi)
	local pos = GetEntityCoords(PlayerPedId(kisi))
	local var1 = GetStreetNameAtCoord(pos.x, pos.y, pos.z, Citizen.ResultAsInteger(), Citizen.ResultAsInteger())
	local sokak = GetStreetNameFromHashKey(var1)
	local id = GetPlayerFromServerId(kisi)
	exports['mythic_notify']:DoHudText('success', yazisonuc .. ' numarasını araştırdığın kişi ' .. sokak .. ' bölgesinde')
	createBlip2(id, yazisonuc)
end)

function hack(success, timeremaining)
	menu = 0
	if success then
		
		if Deger == 3 then
			TriggerEvent('mhacking:hide')
			TriggerEvent("mdt:close")
			TriggerServerEvent('mdt:tel-no', yazisonuc)
		end
		if Deger == 5 then
			TriggerEvent('mhacking:hide')
			TriggerEvent("mdt:close")
			TriggerServerEvent('mdt:tel-no2', yazisonuc)
		end
		if Deger == 13 then
			TriggerEvent('mhacking:hide')
			TriggerEvent("mdt:close")
			TriggerEvent('mdt:elektrikkes')
        end


	else
		exports['mythic_notify']:DoHudText('error', 'Başarısız oldun!!')
        TriggerEvent('mhacking:hide')
        TriggerEvent("mdt:close")	
			PlaySound(-1, "Menu_Accept", "Phone_SoundSet_Default", 0, 0, 1)
			Citizen.Wait(300)
			PlaySound(-1, "Menu_Accept", "Phone_SoundSet_Default", 0, 0, 1)
			Citizen.Wait(300)
			PlaySound(-1, "Menu_Accept", "Phone_SoundSet_Default", 0, 0, 1)
	end
end



RegisterNetEvent("mdt:toggleVisibilty")
AddEventHandler("mdt:toggleVisibilty", function(reports, warrants, officer, jobgrade, sabika, arananlar)
    local playerPed = PlayerPedId()

    if not isVisible then
        local dict = "amb@world_human_seat_wall_tablet@female@base"
        RequestAnimDict(dict)
        if tabletObject == nil then
            tabletObject = CreateObject(GetHashKey('prop_cs_tablet'), GetEntityCoords(playerPed), 1, 1, 1)
            AttachEntityToEntity(tabletObject, playerPed, GetPedBoneIndex(playerPed, 28422), 0.0, 0.0, 0.03, 0.0, 0.0, 0.0, 1, 1, 0, 1, 0, 1)
        end
        while not HasAnimDictLoaded(dict) do Citizen.Wait(100) end
        if not IsEntityPlayingAnim(playerPed, dict, 'base', 3) then
            TaskPlayAnim(playerPed, dict, "base", 8.0, 1.0, -1, 49, 1.0, 0, 0, 0)
        end
    else
        DeleteEntity(tabletObject)
        ClearPedTasks(playerPed)
        tabletObject = nil
    end
    if #warrants == 0 then warrants = false end
    if #reports == 0 then reports = false end
     
    SendNUIMessage({
        type = "recentReportsAndWarrantsLoaded",
        reports = reports,
        warrants = warrants,
        officer = officer,
        jobgrade = jobgrade,
        sabika = sabika,
        arananlar = arananlar
    })
    ToggleGUI()
end)

RegisterNUICallback("close", function(data, cb)
    local playerPed = PlayerPedId()
    DeleteEntity(tabletObject)
    ClearPedTasks(playerPed)
    tabletObject = nil
    ToggleGUI(false)
    cb('ok')
end)

RegisterNetEvent("mdt:close")
AddEventHandler("mdt:close", function()
    local playerPed = PlayerPedId()
    DeleteEntity(tabletObject)
    ClearPedTasks(playerPed)
    tabletObject = nil
    ToggleGUI(false)
end)



RegisterNUICallback("performOffenderSearch", function(data, cb)
    TriggerServerEvent("mdt:performOffenderSearch", data.query)
    cb('ok')
end)

RegisterNUICallback("chatNew", function(data, cb)
    TriggerServerEvent("mdt:chatNew", data)
    cb('ok')
end)

RegisterNUICallback("viewOffender", function(data, cb)
    TriggerServerEvent("mdt:getOffenderDetails", data.offender)
    cb('ok')
end)

RegisterNUICallback("saveOffenderChanges", function(data, cb)
    TriggerServerEvent("mdt:saveOffenderChanges", data.id, data.changes, data.identifier)
    cb('ok')
end)

RegisterNUICallback("submitNewReport", function(data, cb)
    TriggerServerEvent("mdt:submitNewReport", data)
    cb('ok')
end)

RegisterNUICallback("performReportSearch", function(data, cb)
    TriggerServerEvent("mdt:performReportSearch", data.query)
    cb('ok')
end)

RegisterNUICallback("getOffender", function(data, cb)
    TriggerServerEvent("mdt:getOffenderDetailsById", data.char_id)
    cb('ok')
end)

RegisterNUICallback("deleteReport", function(data, cb)
    TriggerServerEvent("mdt:deleteReport", data.id)
    cb('ok')
end)

RegisterNUICallback("saveReportChanges", function(data, cb)
    TriggerServerEvent("mdt:saveReportChanges", data)
    cb('ok')
end)

RegisterNUICallback("vehicleSearch", function(data, cb)
    TriggerServerEvent("mdt:performVehicleSearch", data.plate)
    cb('ok')
end)

RegisterNUICallback("getVehicle", function(data, cb)
    TriggerServerEvent("mdt:getVehicle", data.vehicle)
    cb('ok')
end)

RegisterNUICallback("getWarrants", function(data, cb)
    TriggerServerEvent("mdt:getWarrants")
    cb('ok')
end)

RegisterNUICallback("getFaturalar", function(data, cb)
    TriggerServerEvent("mdt:getFaturalar")
    cb('ok')
end)

RegisterNUICallback("submitNewWarrant", function(data, cb)
    TriggerServerEvent("mdt:submitNewWarrant", data)
    cb('ok')
end)

RegisterNUICallback("submitNewFatura", function(data, cb)
    TriggerServerEvent("mdt:submitNewFatura", data)
    cb('ok')
end)

RegisterNUICallback("mobese", function(data, cb)
    TriggerServerEvent("mdt:mobese")
    TriggerEvent("mdt:close")
    cb('ok')
end)

RegisterNUICallback("deleteWarrant", function(data, cb)
    TriggerServerEvent("mdt:deleteWarrant", data.id)
    cb('ok')
end)

RegisterNUICallback("deleteFatura", function(data, cb)
    TriggerServerEvent("mdt:deleteFatura", data.id)
    cb('ok')
end)

RegisterNUICallback("getChat", function(data, cb)
    TriggerServerEvent("mdt:getChat")
    cb('ok')
end)

RegisterNUICallback("deleteWarrant", function(data, cb)
    TriggerServerEvent("mdt:deleteWarrant", data.id)
    cb('ok')
end)

RegisterNUICallback("getReport", function(data, cb)
    TriggerServerEvent("mdt:getReportDetailsById", data.id)
    cb('ok')
end)

RegisterNUICallback("sentencePlayer", function(data, cb)
    local players = {}
    for i = 0, 256 do
        if GetPlayerServerId(i) ~= 0 then
            table.insert(players, GetPlayerServerId(i))
        end
    end
    TriggerServerEvent("mdt:sentencePlayer", data.jailtime, data.charges, data.char_id, data.fine, players)
    cb('ok')
end)

RegisterNetEvent("mdt:returnOffenderSearchResults")
AddEventHandler("mdt:returnOffenderSearchResults", function(results)
    SendNUIMessage({
        type = "returnedPersonMatches",
        matches = results
    })
end)

RegisterNetEvent("mdt:returnOffenderDetails")
AddEventHandler("mdt:returnOffenderDetails", function(data)
    SendNUIMessage({
        type = "returnedOffenderDetails",
        details = data
    })
end)

RegisterNetEvent("mdt:returnOffensesAndOfficer")
AddEventHandler("mdt:returnOffensesAndOfficer", function(data, name)
    SendNUIMessage({
        type = "offensesAndOfficerLoaded",
        offenses = data,
        name = name
    })
end)

RegisterNetEvent("mdt:returnReportSearchResults")
AddEventHandler("mdt:returnReportSearchResults", function(results)
    table.sort(results, function(a, b) return a["id"] > b["id"] end)
    SendNUIMessage({
        type = "returnedReportMatches",
        matches = results
    })
end)

RegisterNetEvent("mdt:returnVehicleSearchInFront")
AddEventHandler("mdt:returnVehicleSearchInFront", function(results, plate)
    SendNUIMessage({
        type = "returnedVehicleMatchesInFront",
        matches = results,
        plate = plate
    })
end)

RegisterNetEvent("mdt:returnVehicleSearchResults")
AddEventHandler("mdt:returnVehicleSearchResults", function(results)
    SendNUIMessage({
        type = "returnedVehicleMatches",
        matches = results
    })
end)

RegisterNetEvent("mdt:returnVehicleDetails")
AddEventHandler("mdt:returnVehicleDetails", function(data)
    data.model = GetLabelText(GetDisplayNameFromVehicleModel(data.model))
    SendNUIMessage({
        type = "returnedVehicleDetails",
        details = data
    })
end)

RegisterNetEvent("mdt:returnWarrants")
AddEventHandler("mdt:returnWarrants", function(data)
    SendNUIMessage({
        type = "returnedWarrants",
        warrants = data
    })
end)


RegisterNetEvent("mdt:returnFaturalar")
AddEventHandler("mdt:returnFaturalar", function(data, name, names)
    SendNUIMessage({
        type = "returnedFaturalar",
        faturalar = data,
        name = name,
        name2 = names
    })
end)

RegisterNetEvent("mdt:returnFaturalar2")
AddEventHandler("mdt:returnFaturalar2", function()
    SendNUIMessage({
        type = "returnedFaturalar2"
    })
end)

RegisterNetEvent("mdt:returnChat")
AddEventHandler("mdt:returnChat", function(data)
    table.sort(data, function(a, b) return a["id"] > b["id"] end)
    SendNUIMessage({
        type = "returnedChat",
        chat = data
    })
end)

RegisterNetEvent("mdt:completedWarrantAction")
AddEventHandler("mdt:completedWarrantAction", function(data)
    SendNUIMessage({
        type = "completedWarrantAction"
    })
end)

RegisterNetEvent("mdt:completedFaturalar")
AddEventHandler("mdt:completedFaturalar", function(data)
    SendNUIMessage({
        type = "completedFaturalar"
    })
end)

RegisterNetEvent("mdt:returnReportDetails")
AddEventHandler("mdt:returnReportDetails", function(data)
    SendNUIMessage({
        type = "returnedReportDetails",
        details = data
    })
end)

RegisterNetEvent("mdt:billPlayer")
AddEventHandler("mdt:billPlayer", function(src, sharedAccountName, label, amount)
    TriggerServerEvent("esx_billing:sendBill", src, sharedAccountName, label, amount)
end)

function ToggleGUI(explicit_status)
  if explicit_status ~= nil then
    isVisible = explicit_status
  else
    isVisible = not isVisible
  end
  SetNuiFocus(isVisible, isVisible)
  SendNUIMessage({
    type = "enable",
    isVisible = isVisible
  })
end

function getVehicleInFront()
    local playerPed = PlayerPedId()
    local coordA = GetEntityCoords(playerPed, 1)
    local coordB = GetOffsetFromEntityInWorldCoords(playerPed, 0.0, 10.0, 0.0)
    local targetVehicle = getVehicleInDirection(coordA, coordB)
    return targetVehicle
end

function getVehicleInDirection(coordFrom, coordTo)
    local rayHandle = CastRayPointToPoint(coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 10, GetPlayerPed(-1), 0)
    local a, b, c, d, vehicle = GetRaycastResult(rayHandle)
    return vehicle
end



RegisterNUICallback('takeMDTPhoto', function(data, cb)
  ToggleGUI(false)
  local takePhoto = true
  local takeMDTPhoto = true
  local hasFocus
  Citizen.Wait(0)
  if hasFocus == true then
    hasFocus = false
  end
	while takeMDTPhoto do
    Citizen.Wait(0)
    SetFollowPedCamViewMode(4)
    DisableControlAction(1,21,true) -- disable sprint
    DisableControlAction(1,24,true) -- disable attack
    DisableControlAction(1,25,true) -- disable aim
    DisableControlAction(1,32,true) -- move (w)
    DisableControlAction(1,34,true) -- move (a)
    DisableControlAction(1,33,true) -- move (s)
    DisableControlAction(1,35,true) -- move (d)
    if IsControlJustPressed(1, 177)  and GetLastInputMethod(2) then -- CANCEL
      cb(json.encode({ url = nil }))
      takeMDTPhoto = false
      ToggleGUI(true)
      break
    elseif IsControlJustPressed(1, 176)  and GetLastInputMethod(2) then -- TAKE.. PIC   
        exports['screenshot-basic']:requestScreenshotUpload("http://fivem.launchwares.com/upload.php", 'files[]', function(data2)
            local resp = json.decode(data2)
            TriggerServerEvent("mdt:saveMugshot", data.id, resp.files[1].url)         
      end)
      takeMDTPhoto = false
      SetFollowPedCamViewMode(1)
      ToggleGUI(true)
		end
		HideHudComponentThisFrame(7)
		HideHudComponentThisFrame(8)
		HideHudComponentThisFrame(9)
		HideHudComponentThisFrame(6)
		HideHudComponentThisFrame(19)
        HideHudAndRadarThisFrame()
      
  end
  Citizen.Wait(1000)
  cb('ok')
end)
