ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('luck:item', function(source, cb, item)
	local xPlayer = ESX.GetPlayerFromId(source)
	local qtty = xPlayer.getInventoryItem(item).count
	cb(qtty)
end)



TriggerEvent('es:addCommand', 'ptablet', function(source, args, user)
	local usource = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local sabika = 0
	local arananlar = 0
	local jobgrade = xPlayer.job.grade
	if xPlayer.getInventoryItem('mdt').count > 0 then
    if xPlayer.job.name == 'police' or xPlayer.job.name == 'sheriff' then
    	MySQL.Async.fetchAll("SELECT * FROM (SELECT * FROM `mdt_reports` ORDER BY `id` DESC LIMIT 3) sub ORDER BY `id` DESC", {}, function(reports)
			for r = 1, #reports do
    			reports[r].charges = json.decode(reports[r].charges)
			end
			MySQL.Async.fetchAll("SELECT * FROM (SELECT * FROM `mdt_reports` ORDER BY `id`) sub ORDER BY `id", {}, function(rp)
				for c = 1, #rp do
    				sabika = sabika + 1
				end
				
				MySQL.Async.fetchAll("SELECT * FROM (SELECT * FROM `mdt_warrants` ORDER BY `id`) sub ORDER BY `id", {}, function(ar)
					for d = 1, #ar do
						arananlar = arananlar + 1
					end
				
    		
    		MySQL.Async.fetchAll("SELECT * FROM (SELECT * FROM `mdt_warrants` ORDER BY `id` DESC LIMIT 3) sub ORDER BY `id` DESC", {}, function(warrants)
    			for w = 1, #warrants do
    				warrants[w].charges = json.decode(warrants[w].charges)
				end
				
				local officer = GetCharacterName(usource)
    			TriggerClientEvent('mdt:toggleVisibilty', usource, reports, warrants, officer, jobgrade, sabika, arananlar)
			end)
		end)
		end)
		end)
	else
		TriggerClientEvent('mythic_notify:client:SendAlert', usource, { type = 'error', text = 'Tablet şifresini bilmiyorsun!'})
	end
else
	TriggerClientEvent('mythic_notify:client:SendAlert', usource, { type = 'error', text = 'Üzerinde tablet yok!'})
end
end)

RegisterServerEvent('mdt:hack')
AddEventHandler('mdt:hack', function(data, data2)
	local _source = source
	if data == 'telsiz' then
		Twitter = data2
		if Twitter == "1" or Twitter == "2" or Twitter == "3" or Twitter == "4" or Twitter == "5" or Twitter == "6" or Twitter == "7" or Twitter == "8" or Twitter == "9" or Twitter == "10" then
		local Deger2 = 9
		TriggerClientEvent('mdt:hack-islemi', _source, Deger2)
		else
		TriggerClientEvent("mdt:returnLogin", _source, "noradio")
		end
	elseif data == 'araba' then
		local Deger2 = 8
		TriggerClientEvent('mdt:hack-islemi', _source, Deger2)
	elseif data == 'aracmotor' then
		local Deger2 = 7
		TriggerClientEvent('mdt:hack-islemi', _source, Deger2)
	elseif data == 'aktif' then
		Twitter = data2
		if Twitter == "1" then
		local Deger2 = 2
		TriggerClientEvent('mdt:hack-islemi', _source, Deger2)
		elseif Twitter == "2" then
		local Deger2 = 20
		TriggerClientEvent('mdt:hack-islemi', _source, Deger2)
		elseif Twitter == "3" then
			local Deger2 = 21
			TriggerClientEvent('mdt:hack-islemi', _source, Deger2)
		end
	elseif data == 'gpslspd' then
		local Deger2 = 11
		TriggerClientEvent('mdt:hack-islemi', _source, Deger2)
	elseif data == 'aracguc' then
		local Deger2 = 12
		TriggerClientEvent('mdt:hack-islemi', _source, Deger2)
		
		elseif data == "telefontelsiz" then		
			local Deger2 = 10
			local result = MySQL.Sync.fetchAll("SELECT users.identifier FROM users WHERE users.phone_number =@phone_number", {
				['@phone_number'] = Twitter
			})
			if result[1] == nil then
				TriggerClientEvent("mdt:returnLogin", _source, "nonumber")
			else
				TriggerClientEvent('mdt:hack-islemi', _source, Deger2)
			end
			TriggerClientEvent('mdt:hack-islemi', _source, Deger2)
		elseif data == "telefonkimlik" then			
     		local Deger2 = 3
			Twitter = data2
			local result = MySQL.Sync.fetchAll("SELECT users.identifier FROM users WHERE users.phone_number =@phone_number", {
				['@phone_number'] = Twitter
			})
			if result[1] == nil then
				TriggerClientEvent("mdt:returnLogin", _source,  "nonumber")
			else
				TriggerClientEvent('mdt:hack-islemi', _source, Deger2)
			end
		elseif data == "telkonum" then		
			local Deger2 = 5
			Twitter = data2
			local result = MySQL.Sync.fetchAll("SELECT users.identifier FROM users WHERE users.phone_number =@phone_number", {
				['@phone_number'] = Twitter
			})
			if result[1] == nil then
				TriggerClientEvent("mdt:returnLogin", _source,  "nonumber")
			else
				TriggerClientEvent('mdt:hack-islemi', _source, Deger2)
			end
		elseif data == "bankapara" then	
      		local Deger2 = 6
			Twitter = data2
			local result = MySQL.Sync.fetchAll("SELECT users.identifier FROM users WHERE users.phone_number =@phone_number", {
				['@phone_number'] = Twitter
			})
			if result[1] == nil then
				TriggerClientEvent("mdt:returnLogin", _source, "nonumber")
			else
				TriggerClientEvent('mdt:hack-islemi', _source, Deger2)
			end
			TriggerClientEvent('mdt:hack-islemi', _source, Deger2)
	
    elseif data == 'elektrikkes' then
	local Deger2 = 13
	TriggerClientEvent('mdt:hack-islemi', _source, Deger2)
    elseif data == 'twitter' then
	local Deger2 = 31
	Twitter = data2
	TriggerClientEvent('mdt:hack-islemi', _source, Deger2)
    end
end)



RegisterServerEvent('mdt:elektrikkes')
AddEventHandler('mdt:elektrikkes', function(type)
TriggerClientEvent('mdt:elektrikc', -1, type)
end)

RegisterServerEvent('mdt:tel-no2')
AddEventHandler('mdt:tel-no2', function(yazisonuc)
	local _source = source
	local result = MySQL.Sync.fetchAll("SELECT users.identifier FROM users WHERE users.phone_number =@phone_number", {
		['@phone_number'] = Twitter
	})
	
	if result[1] ~= nil then
		local kisaltma = result[1].identifier
		if kisaltma ~= nil then 
			getSourceFromIdentifier(kisaltma, function (osou)
				if tonumber(osou) ~= nil then
					local kisi = tonumber(osou)
					TriggerClientEvent('mdt:tel-lokasyon', _source, Twitter, kisi)
				end
			end)
		end
	else
		TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'error', text = 'Böyle bir numara kayıtlı değil.', lenght = 4000 })
	end
end)


function getSourceFromIdentifier(identifier, cb)
    TriggerEvent("es:getPlayers", function(users)
        for k , user in pairs(users) do
            if (user.getIdentifier ~= nil and user.getIdentifier() == identifier) or (user.identifier == identifier) then
                cb(k)
                return
            end
        end
    end)
    cb(nil)
end


RegisterServerEvent('mdt:tel-no')
AddEventHandler('mdt:tel-no', function(yazisonuc)
	local _source = source
	local result = MySQL.Sync.fetchAll("SELECT users.firstname FROM users WHERE users.phone_number =@phone_number", {
		['@phone_number'] = Twitter
	})
	
	local sonuc = MySQL.Sync.fetchAll("SELECT users.lastname FROM users WHERE users.phone_number =@phone_number", {
		['@phone_number'] = Twitter
	})

	if result[1] ~= nil then
		TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'success', text = 'Numara sahibi: ' .. result[1].firstname .. ' Soyadı ' .. sonuc[1].lastname, lenght = 8000 })
	else
		TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'error', text = 'Böyle bir numara kayıtlı değil.', lenght = 4000 })
	end

end)


ESX.RegisterUsableItem('mdt', function(source)
	local usource = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local jobgrade = xPlayer.job.grade
	if xPlayer.getInventoryItem('mdt').count > 0 then
    if xPlayer.job.name == 'police' or xPlayer.job.name == 'sheriff' then
    	MySQL.Async.fetchAll("SELECT * FROM (SELECT * FROM `mdt_reports` ORDER BY `id` DESC LIMIT 3) sub ORDER BY `id` DESC", {}, function(reports)
    		for r = 1, #reports do
    			reports[r].charges = json.decode(reports[r].charges)
    		end
    		MySQL.Async.fetchAll("SELECT * FROM (SELECT * FROM `mdt_warrants` ORDER BY `id` DESC LIMIT 3) sub ORDER BY `id` DESC", {}, function(warrants)
    			for w = 1, #warrants do
    				warrants[w].charges = json.decode(warrants[w].charges)
				end
				
    			local officer = GetCharacterName(usource)
    			TriggerClientEvent('mdt:toggleVisibilty', usource, reports, warrants, officer, jobgrade)
    		end)
		end)
	else
		TriggerClientEvent('mythic_notify:client:SendAlert', usource, { type = 'error', text = 'Tablet şifresini bilmiyorsun!'})
	end
else
	TriggerClientEvent('mythic_notify:client:SendAlert', usource, { type = 'error', text = 'Üzerinde tablet yok!!'})
end
end)


RegisterServerEvent("mdt:hotKeyOpen")
AddEventHandler("mdt:hotKeyOpen", function()
	local usource = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local jobgrade = xPlayer.job.grade
	if xPlayer.getInventoryItem('mdt').count > 0 then
    if xPlayer.job.name == 'police' or xPlayer.job.name == 'sheriff' then
    	MySQL.Async.fetchAll("SELECT * FROM (SELECT * FROM `mdt_reports` ORDER BY `id` DESC LIMIT 3) sub ORDER BY `id` DESC", {}, function(reports)
    		for r = 1, #reports do
    			reports[r].charges = json.decode(reports[r].charges)
    		end
    		MySQL.Async.fetchAll("SELECT * FROM (SELECT * FROM `mdt_warrants` ORDER BY `id` DESC LIMIT 3) sub ORDER BY `id` DESC", {}, function(warrants)
    			for w = 1, #warrants do
    				warrants[w].charges = json.decode(warrants[w].charges)
				end
				
    			local officer = GetCharacterName(usource)
    			TriggerClientEvent('mdt:toggleVisibilty', usource, reports, warrants, officer, jobgrade)
    		end)
		end)
	else
		TriggerClientEvent('mythic_notify:client:SendAlert', usource, { type = 'error', text = 'Tablet şifresini bilmiyorsun!'})
	end
else
	TriggerClientEvent('mythic_notify:client:SendAlert', usource, { type = 'error', text = 'Üzerinde tablet yok!!'})
end
end)

RegisterServerEvent("mdt:getOffensesAndOfficer")
AddEventHandler("mdt:getOffensesAndOfficer", function()
	local usource = source
	local charges = {}
	MySQL.Async.fetchAll('SELECT * FROM fine_types', {
	}, function(fines)
		for j = 1, #fines do
			if fines[j].category == 0 or fines[j].category == 1 or fines[j].category == 2 or fines[j].category == 3 then
				table.insert(charges, fines[j])
			end
		end

		local officer = GetCharacterName(usource)

		TriggerClientEvent("mdt:returnOffensesAndOfficer", usource, charges, officer)
	end)
end)

RegisterServerEvent("mdt:performOffenderSearch")
AddEventHandler("mdt:performOffenderSearch", function(query)
	local usource = source
	local matches = {}
	MySQL.Async.fetchAll("SELECT * FROM `characters` WHERE LOWER(`firstname`) LIKE @query OR LOWER(`lastname`) LIKE @query OR CONCAT(LOWER(`firstname`), ' ', LOWER(`lastname`)) LIKE @query", {
		['@query'] = string.lower('%'..query..'%') -- % wildcard, needed to search for all alike results
	}, function(result)

		for index, data in ipairs(result) do
			table.insert(matches, data)
		end
		TriggerClientEvent("mdt:returnOffenderSearchResults", usource, matches)

	end)
end)

RegisterServerEvent("mdt:getOffenderDetails")
AddEventHandler("mdt:getOffenderDetails", function(offender)
	local usource = source
	GetLicenses(offender.identifier, function(licenses) offender.licenses = licenses end)
	while offender.licenses == nil do Citizen.Wait(0) end
	MySQL.Async.fetchAll('SELECT * FROM `user_mdt` WHERE `char_id` = @id', {
		['@id'] = offender.id
	}, function(result)
		offender.notes = ""
		offender.mugshot_url = ""
		if result[1] then
			offender.notes = result[1].notes
			offender.mugshot_url = result[1].mugshot_url
		end
		MySQL.Async.fetchAll('SELECT * FROM `user_convictions` WHERE `char_id` = @id', {
			['@id'] = offender.id
		}, function(convictions)
			if convictions[1] then
				offender.convictions = {}
				for i = 1, #convictions do
					local conviction = convictions[i]
					offender.convictions[conviction.offense] = conviction.count
				end
			end

			MySQL.Async.fetchAll('SELECT * FROM `mdt_warrants` WHERE `char_id` = @id', {
				['@id'] = offender.id
			}, function(warrants)
				if warrants[1] then
					offender.haswarrant = true
				end

			
			end)
			MySQL.Async.fetchAll('SELECT * FROM `users` WHERE `identifier` = @query', {
				['@query'] = offender.identifier -- % wildcard, needed to search for all alike results
			}, function(result2)
				if result2[1] then
					offender.varlik = result2[1]
				end
				TriggerClientEvent("mdt:returnOffenderDetails", usource, offender)
			end)
		end)
	end)
end)

RegisterServerEvent("mdt:getOffenderDetailsById")
AddEventHandler("mdt:getOffenderDetailsById", function(char_id)
	local usource = source
	MySQL.Async.fetchAll('SELECT * FROM `characters` WHERE `id` = @id', {
		['@id'] = char_id
	}, function(result)
		local offender = result[1]
		GetLicenses(offender.identifier, function(licenses) offender.licenses = licenses end)
		while offender.licenses == nil do Citizen.Wait(0) end
		MySQL.Async.fetchAll('SELECT * FROM `user_mdt` WHERE `char_id` = @id', {
			['@id'] = offender.id
		}, function(result)
			offender.notes = ""
			offender.mugshot_url = ""
			if result[1] then
				offender.notes = result[1].notes
				offender.mugshot_url = result[1].mugshot_url
			end
			MySQL.Async.fetchAll('SELECT * FROM `user_convictions` WHERE `char_id` = @id', {
				['@id'] = offender.id
			}, function(convictions)
				if convictions[1] then
					offender.convictions = {}
					for i = 1, #convictions do
						local conviction = convictions[i]
						offender.convictions[conviction.offense] = conviction.count
					end
				end

				TriggerClientEvent("mdt:returnOffenderDetails", usource, offender)
			end)
		end)

	end)
end)

RegisterServerEvent("mdt:saveOffenderChanges")
AddEventHandler("mdt:saveOffenderChanges", function(id, changes, identifier)
	MySQL.Async.fetchAll('SELECT * FROM `user_mdt` WHERE `char_id` = @id', {
		['@id']  = id
	}, function(result)
		if result[1] then
			MySQL.Async.execute('UPDATE `user_mdt` SET `notes` = @notes, `mugshot_url` = @mugshot_url WHERE `char_id` = @id', {
				['@id'] = id,
				['@notes'] = changes.notes,
				['@mugshot_url'] = changes.mugshot_url
			})
		else
			MySQL.Async.insert('INSERT INTO `user_mdt` (`char_id`, `notes`, `mugshot_url`) VALUES (@id, @notes, @mugshot_url)', {
				['@id'] = id,
				['@notes'] = changes.notes,
				['@mugshot_url'] = changes.mugshot_url
			})
		end
		for i = 1, #changes.licenses_removed do
			local license = changes.licenses_removed[i]
			MySQL.Async.execute('DELETE FROM `user_licenses` WHERE `type` = @type AND `owner` = @identifier', {
				['@type'] = license.type,
				['@identifier'] = identifier
			})
		end

		for conviction, amount in pairs(changes.convictions) do	
			MySQL.Async.execute('UPDATE `user_convictions` SET `count` = @count WHERE `char_id` = @id AND `offense` = @offense', {
				['@id'] = id,
				['@count'] = amount,
				['@offense'] = conviction
			})
		end

		for i = 1, #changes.convictions_removed do
			MySQL.Async.execute('DELETE FROM `user_convictions` WHERE `char_id` = @id AND `offense` = @offense', {
				['@id'] = id,
				['offense'] = changes.convictions_removed[i]
			})
		end
	end)
end)

RegisterServerEvent("mdt:saveMugshot")
AddEventHandler("mdt:saveMugshot", function(id, mugshot)
	MySQL.Async.fetchAll('SELECT * FROM `user_mdt` WHERE `char_id` = @id', {
		['@id']  = id
	}, function(result)
		if result[1] then
			MySQL.Async.execute('UPDATE `user_mdt` SET `mugshot_url` = @mugshot_url WHERE `char_id` = @id', {
				['@id'] = id,
				['@mugshot_url'] = mugshot
			})
		else
			MySQL.Async.insert('INSERT INTO `user_mdt` (`char_id`, `notes`, `mugshot_url`) VALUES (@id, @notes, @mugshot_url)', {
				['@id'] = id,
				['@mugshot_url'] = mugshot
			})
			end
		end)
end)





RegisterServerEvent("mdt:saveReportChanges")
AddEventHandler("mdt:saveReportChanges", function(data)
	MySQL.Async.execute('UPDATE `mdt_reports` SET `title` = @title, `incident` = @incident WHERE `id` = @id', {
		['@id'] = data.id,
		['@title'] = data.title,
		['@incident'] = data.incident
	})
end)

RegisterServerEvent("mdt:mobese")
AddEventHandler("mdt:mobese", function()
TriggerClientEvent('luck_mdt:mobese', source)
end)

RegisterServerEvent("mdt:deleteReport")
AddEventHandler("mdt:deleteReport", function(id)
	MySQL.Async.execute('DELETE FROM `mdt_reports` WHERE `id` = @id', {
		['@id']  = id
	})
end)

RegisterServerEvent("mdt:submitNewReport")
AddEventHandler("mdt:submitNewReport", function(data)
	local usource = source
	local author = GetCharacterName(source)
	if tonumber(data.sentence) and tonumber(data.sentence) > 0 then
		data.sentence = tonumber(data.sentence)
	else 
		data.sentence = nil 
	end
	charges = json.encode(data.charges)
	data.date = os.date('%m-%d-%Y %H:%M:%S', os.time())
	MySQL.Async.insert('INSERT INTO `mdt_reports` (`char_id`, `title`, `incident`, `charges`, `author`, `name`, `date`, `jailtime`) VALUES (@id, @title, @incident, @charges, @author, @name, @date, @sentence)', {
		['@id']  = data.char_id,
		['@title'] = data.title,
		['@incident'] = data.incident,
		['@charges'] = charges,
		['@author'] = author,
		['@name'] = data.name,
		['@date'] = data.date,
		['@sentence'] = data.sentence
	}, function(id)
		TriggerEvent("mdt:getReportDetailsById", id, usource)
	end)

	for offense, count in pairs(data.charges) do
		MySQL.Async.fetchAll('SELECT * FROM `user_convictions` WHERE `offense` = @offense AND `char_id` = @id', {
			['@offense'] = offense,
			['@id'] = data.char_id
		}, function(result)
			if result[1] then
				MySQL.Async.execute('UPDATE `user_convictions` SET `count` = @count WHERE `offense` = @offense AND `char_id` = @id', {
					['@id']  = data.char_id,
					['@offense'] = offense,
					['@count'] = count + 1
				})
			else
				MySQL.Async.insert('INSERT INTO `user_convictions` (`char_id`, `offense`, `count`) VALUES (@id, @offense, @count)', {
					['@id']  = data.char_id,
					['@offense'] = offense,
					['@count'] = count
				})
			end
		end)
	end
end)

RegisterServerEvent("mdt:sentencePlayer")
AddEventHandler("mdt:sentencePlayer", function(jailtime, charges, char_id, fine, players)
	local usource = source
	local jailmsg = ""
	for offense, amount in pairs(charges) do
		jailmsg = jailmsg .. " "..offense.." x"..amount.." |"
	end
	for _, src in pairs(players) do
		if src ~= 0 and GetPlayerName(src) then
			MySQL.Async.fetchAll('SELECT * FROM `characters` WHERE `identifier` = @identifier', {
				['@identifier'] = GetPlayerIdentifiers(src)[1]
			}, function(result)
				if result[1].id == char_id then
					if jailtime and jailtime > 0 then
						jailtime = math.ceil(jailtime)
						TriggerEvent("esx-qalle-jail:jailPlayer", src, jailtime, jailmsg)
					end
					if fine > 0 then
						TriggerClientEvent("mdt:billPlayer", usource, src, 'society_police', 'Fine: '..jailmsg, fine)
					end
					return
				end
			end)
		end
	end
end)

RegisterServerEvent("mdt:performReportSearch")
AddEventHandler("mdt:performReportSearch", function(query)
	local usource = source
	local matches = {}
	MySQL.Async.fetchAll("SELECT * FROM `mdt_reports` WHERE `id` LIKE @query OR LOWER(`title`) LIKE @query OR LOWER(`name`) LIKE @query OR LOWER(`author`) LIKE @query", {
		['@query'] = string.lower('%'..query..'%') -- % wildcard, needed to search for all alike results
	}, function(result)

		for index, data in ipairs(result) do
			data.charges = json.decode(data.charges)
			table.insert(matches, data)
		end

		TriggerClientEvent("mdt:returnReportSearchResults", usource, matches)
	end)
end)



RegisterServerEvent("mdt:performVehicleSearch")
AddEventHandler("mdt:performVehicleSearch", function(query)
	local usource = source
	local matches = {}
	MySQL.Async.fetchAll("SELECT * FROM `owned_vehicles` WHERE LOWER(`plate`) LIKE @query", {
		['@query'] = string.lower('%'..query..'%') -- % wildcard, needed to search for all alike results
	}, function(result)

		for index, data in ipairs(result) do
			local data_decoded = json.decode(data.vehicle)
			data.model = data_decoded.model
			if data_decoded.color1 then
				data.color = colors[tostring(data_decoded.color1)]
				if colors[tostring(data_decoded.color2)] then
					data.color = colors[tostring(data_decoded.color2)] .. " on " .. colors[tostring(data_decoded.color1)]
				end
			end
			table.insert(matches, data)
		end

		TriggerClientEvent("mdt:returnVehicleSearchResults", usource, matches)
	end)
end)

RegisterServerEvent("mdt:performVehicleSearchInFront")
AddEventHandler("mdt:performVehicleSearchInFront", function(query)
	local usource = source
	local xPlayer = ESX.GetPlayerFromId(usource)
    if xPlayer.job.name == 'police' then
		MySQL.Async.fetchAll("SELECT * FROM `owned_vehicles` WHERE `plate` = @query", {
			['@query'] = query
		}, function(result)
			TriggerClientEvent("mdt:toggleVisibilty", usource)
			TriggerClientEvent("mdt:returnVehicleSearchInFront", usource, result, query)
		end)
	end
end)

RegisterServerEvent("mdt:getVehicle")
AddEventHandler("mdt:getVehicle", function(vehicle)
	local usource = source
	MySQL.Async.fetchAll("SELECT * FROM `characters` WHERE `identifier` = @query", {
		['@query'] = vehicle.owner
	}, function(result)
		if result[1] then
			vehicle.owner = result[1].firstname .. ' ' .. result[1].lastname
			vehicle.owner_id = result[1].id
		end

		vehicle.type = types[vehicle.type]
		TriggerClientEvent("mdt:returnVehicleDetails", usource, vehicle)
	end)
end)

RegisterServerEvent("mdt:getFaturalar")
AddEventHandler("mdt:getFaturalar", function()
	local usource = source
	local name, names
	MySQL.Async.fetchAll("SELECT * FROM `billing`", {}, function(faturalar)
		if faturalar[1] ~= nil then
		for i = 1, #faturalar do
			if faturalar[i].target == 'society_police' then
			name = GetCharacterName2(faturalar[i].identifier)
			print(faturalar[i].sender)
		
			names = GetCharacterName2(faturalar[i].sender)
			TriggerClientEvent("mdt:returnFaturalar", usource, faturalar, name, names)
		end	
		end
	else
		TriggerClientEvent("mdt:returnFaturalar2", usource)
	end
	end)
end)

RegisterServerEvent("mdt:getChat")
AddEventHandler("mdt:getChat", function()
    local usource = source
    MySQL.Async.fetchAll("SELECT * FROM mdt_chat ORDER BY id", {}, function(result)
        if result[1] ~= nil then
                TriggerClientEvent("mdt:returnChat", usource, result)
        end
    end)
end)

RegisterServerEvent("mdt:chatNew")
AddEventHandler("mdt:chatNew", function(msg)
	local usource = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local jobgrade = xPlayer.job.grade
	local job = xPlayer.job
	local date = os.date('%m-%d-%Y %H:%M:%S', os.time())
	local jb = GetCharacterName(usource)
	MySQL.Async.insert('INSERT INTO `mdt_chat` (`date`, `msg`, `sender`) VALUES (@date, @msg, @sender)', {
		['@msg']  = msg.msg,

		['@date'] = date,
	
		['@sender'] = jb
	}, function()
		
	end)
	MySQL.Async.fetchAll("SELECT * FROM mdt_chat ORDER BY id", {}, function(result)
        if result[1] ~= nil then
                TriggerClientEvent("mdt:returnChat", usource, result)
        end
    end)

end)

RegisterServerEvent("mdt:getWarrants")
AddEventHandler("mdt:getWarrants", function()
	local usource = source
	MySQL.Async.fetchAll("SELECT * FROM `mdt_warrants`", {}, function(warrants)
		for i = 1, #warrants do
			warrants[i].expire_time = ""
			warrants[i].charges = json.decode(warrants[i].charges)
		end
		TriggerClientEvent("mdt:returnWarrants", usource, warrants)
	end)
end)


RegisterServerEvent("luck_mdt:webhook")
AddEventHandler("luck_mdt:webhook", function(author, data, img)
local xPlayer = ESX.GetPlayerFromId(author)
if xPlayer.job.name == "police" then
DISCORD_WEBHOOK = "https://discordapp.com/api/webhooks/739806713070354523/VPR1sOC_flg1wVbTAih0DeOEYjqZMC9iUBCjYmC2iyitPvdL8Tk54Kc7wTd8w2-B3Uqt"
DISCORD_NAME = "Los Santos Police Departmant" 
DISCORD_IMAGE = "https://media.discordapp.net/attachments/733861468839346186/740764229040210011/logo2.png"
DiscordHook(data.name .. " aranıyor!","Aranma sebebi: **" .. data.report_title .. "**" , 15158332,  author, img)
else
DISCORD_WEBHOOK = "https://discordapp.com/api/webhooks/739806713070354523/VPR1sOC_flg1wVbTAih0DeOEYjqZMC9iUBCjYmC2iyitPvdL8Tk54Kc7wTd8w2-B3Uqt"
DISCORD_NAME = "Los Santos Sheriff Departmant"
DISCORD_IMAGE = "https://cdn.discordapp.com/attachments/724437715164070018/739556862344822895/blainecounty.png"
DiscordHook(data.name .. " aranıyor!","Aranma sebebi: **" .. data.report_title .. "**", 15844367,  author, img)
end
end)

function DiscordHook(name, message, color, author, img)
	local xPlayer = ESX.GetPlayerFromId(author)
	if xPlayer.job.name == "police" then
		unvan = "Polis Memuru"
		baslik = "Los Santos Police Departmant"
	    imggg = "https://cdn.discordapp.com/attachments/708311103435702273/731261982413553680/logo2.png"
	else
		unvan = "Şerif"
		baslik = "Los Santos Sheriff Departmant"
		imggg = "https://cdn.discordapp.com/attachments/724437715164070018/739556862344822895/blainecounty.png"
	end

	local imgg
	 
	if img == nil then
		imgg = "https://png.pngtree.com/png-vector/20200116/ourmid/pngtree-prisoner-and-mugshot-close-up-photography-on-police-department-png-image_2128359.jpg"
	else
		imgg = img
	end
    	
	local connect = {
		  {
			  ["color"] = color,
			  ["title"] = "**".. name .."**",
			  ["author"] =  {
				["name"] = baslik,
				["icon_url"] = imggg
			  }, 
			  ["provider"] =  {
				["name"] = baslik
			  }, 
			  ["description"] = message,
			  ["image"] = {
				["url"] = imgg
			  }, 
			  ["footer"] = {
			  ["text"] = os.date('!%Y-%m-%d / %H:%M:%S') .. " tarihinde " .. unvan .. " " .. GetCharacterName(author) .. " tarafından oluşturuldu.",
			  ["icon_url"] = imggg
			  },
		  }
	  }
	 PerformHttpRequest(DISCORD_WEBHOOK, function(err, text, headers) end, 'POST', json.encode({username = DISCORD_NAME, embeds = connect, avatar_url = DISCORD_IMAGE}), { ['Content-Type'] = 'application/json' })
  end


RegisterServerEvent("mdt:submitNewWarrant")
AddEventHandler("mdt:submitNewWarrant", function(data)
	local usource = source
	
	local xPlayer = ESX.GetPlayerFromId(source)
	data.charges = json.encode(data.charges)
	data.author = GetCharacterName(source)
	data.date = os.date('%m-%d-%Y %H:%M:%S', os.time())
	MySQL.Async.fetchAll("SELECT * FROM user_mdt WHERE char_id = @id", {
		['@id'] = data.char_id
	}, function(result)
			img = result[1].mugshot_url
			TriggerEvent("luck_mdt:webhook", usource, data, img) 		
	end)
	
	MySQL.Async.insert('INSERT INTO `mdt_warrants` (`name`, `char_id`, `report_id`, `report_title`, `charges`, `date`, `expire`, `notes`, `author`) VALUES (@name, @char_id, @report_id, @report_title, @charges, @date, @expire, @notes, @author)', {
		['@name']  = data.name,
		['@char_id'] = data.char_id,
		['@report_id'] = data.report_id,
		['@report_title'] = data.report_title,
		['@charges'] = data.charges,
		['@date'] = data.date,
		['@expire'] = data.expire,
		['@notes'] = data.notes,
		['@author'] = data.author
	}, function()
		TriggerClientEvent("mdt:completedWarrantAction", usource)
	end)

end)


RegisterServerEvent('mdt:submitNewFatura')
AddEventHandler('mdt:submitNewFatura', function(data)
	local xPlayer = ESX.GetPlayerFromId(source)
	MySQL.Async.fetchAll('SELECT * FROM users WHERE lastname = @lastname', {
		['@lastname'] = data.surname
	}, function(result)
	TriggerEvent('esx_billing:sendBillMDT', result[1].identifier, xPlayer.identifier, data.label, data.amount)
	end)	

end)


RegisterServerEvent("mdt:deleteWarrant")
AddEventHandler("mdt:deleteWarrant", function(id)
	local usource = source
	MySQL.Async.execute('DELETE FROM `mdt_warrants` WHERE `id` = @id', {
		['@id']  = id
	}, function()
		TriggerClientEvent("mdt:completedWarrantAction", usource)
	end)
end)


RegisterServerEvent("mdt:deleteFatura")
AddEventHandler("mdt:deleteFatura", function(id)
	local usource = source
	MySQL.Async.execute('DELETE FROM `billing` WHERE `id` = @id', {
		['@id']  = id
	}, function()
		TriggerClientEvent("mdt:completedFaturalar", usource)
	end)
end)


RegisterServerEvent("mdt:getReportDetailsById")
AddEventHandler("mdt:getReportDetailsById", function(query, _source)
	if _source then source = _source end
	local usource = source
	MySQL.Async.fetchAll("SELECT * FROM `mdt_reports` WHERE `id` = @query", {
		['@query'] = query
	}, function(result)
		if result and result[1] then
			result[1].charges = json.decode(result[1].charges)
			TriggerClientEvent("mdt:returnReportDetails", usource, result[1])
		end
	end)
end)

function GetLicenses(identifier, cb)
	MySQL.Async.fetchAll('SELECT * FROM user_licenses WHERE owner = @owner', {
		['@owner'] = identifier
	}, function(result)
		local licenses   = {}
		local asyncTasks = {}

		for i=1, #result, 1 do

			local scope = function(type)
				table.insert(asyncTasks, function(cb)
					MySQL.Async.fetchAll('SELECT * FROM licenses WHERE type = @type', {
						['@type'] = type
					}, function(result2)
						table.insert(licenses, {
							type  = type,
							label = result2[1].label
						})

						cb()
					end)
				end)
			end

			scope(result[i].type)

		end

		Async.parallel(asyncTasks, function(results)
			if #licenses == 0 then licenses = false end
			cb(licenses)
		end)

	end)
end

function GetCharacterName(source)
	local result = MySQL.Sync.fetchAll('SELECT firstname, lastname FROM users WHERE identifier = @identifier', {
		['@identifier'] = GetPlayerIdentifiers(source)[1]
	})

	if result[1] and result[1].firstname and result[1].lastname then
		return ('%s %s'):format(result[1].firstname, result[1].lastname)
	end
end

function GetJobgrade(jobgrade, job, source)
	local result2 = MySQL.Sync.fetchAll('SELECT label FROM job_grades WHERE grade = @grade AND `job_name` = @job_name', {
		['@grade'] = jobgrade,
		['@job_name'] = job
	})

	local result = MySQL.Sync.fetchAll('SELECT firstname, lastname FROM users WHERE identifier = @identifier', {
		['@identifier'] = GetPlayerIdentifiers(source)[1]
	})


	if result[1] and result2[1].label and result[1].firstname and result[1].lastname then
			return('%s %s %s'):format(result2[1].label, result[1].firstname, result[1].lastname)
	end
end

function GetCharacterName2(source)
	local result = MySQL.Sync.fetchAll('SELECT firstname, lastname FROM users WHERE identifier = @identifier', {
		['@identifier'] = source
	})

	if result[1] and result[1].firstname and result[1].lastname then
		return ('%s %s'):format(result[1].firstname, result[1].lastname)
	end
end

function tprint (tbl, indent)
  if not indent then indent = 0 end
  local toprint = string.rep(" ", indent) .. "{\r\n"
  indent = indent + 2 
  for k, v in pairs(tbl) do
    toprint = toprint .. string.rep(" ", indent)
    if (type(k) == "number") then
      toprint = toprint .. "[" .. k .. "] = "
    elseif (type(k) == "string") then
      toprint = toprint  .. k ..  "= "   
    end
    if (type(v) == "number") then
      toprint = toprint .. v .. ",\r\n"
    elseif (type(v) == "string") then
      toprint = toprint .. "\"" .. v .. "\",\r\n"
    elseif (type(v) == "table") then
      toprint = toprint .. tprint(v, indent + 2) .. ",\r\n"
    else
      toprint = toprint .. "\"" .. tostring(v) .. "\",\r\n"
    end
  end
  toprint = toprint .. string.rep(" ", indent-2) .. "}"
  return toprint
end