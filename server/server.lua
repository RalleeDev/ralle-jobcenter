lib.locale() --locale support

RegisterNetEvent('ralle-jobcenter:Setjob', function (job, job_grade)
    local oxPlayer = Ox.GetPlayerFromUserId(source)
    local distance = #(Config.location - oxPlayer.getCoords())
    if distance < 1.5 then
        oxPlayer.setGroup(job, job_grade)
        oxPlayer.setActiveGroup(job)
        TriggerClientEvent('ox_lib:notify', source, {
            id = 'ralle-jobcenter:newJob',
            description = locale('congratulations'),
            duration = 5000,
            type = 'success'
        })
    else
        TriggerClientEvent('ox_lib:notify', source, {
            id = 'ralle-jobcenter:error', 
            description = locale('too_far_away'),
            duration = 5000,
            type = 'error'
        })
    end
end)

lib.addCommand('job', {
    help = locale('job_command_help'),
}, function(source, args, raw)
    local player = Ox.GetPlayerFromUserId(source)
    GetJobs(player.charId)
end)

function GetJobs(charId)
    local response = MySQL.query.await('SELECT `name`, `isActive` FROM `character_groups` WHERE `charId` = ?', {
        charId
    })

    if response[1].isActive then
        local chatMessage = locale('current_job') .. ' ' .. response[1].name

        exports.chat:addMessage(-1, {
            color = {255, 165, 0},
            args = {locale('job'), chatMessage}
        })
    end
end