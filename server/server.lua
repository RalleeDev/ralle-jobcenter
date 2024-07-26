lib.locale()

RegisterNetEvent('ralle-jobcenter:Setjob', function (job, job_grade)
    local oxPlayer = Ox.GetPlayerFromUserId(source)
    local distance = #(Config.location - oxPlayer.getCoords())
    if distance < 1.5 then
        oxPlayer.setGroup(job, job_grade)
    else
        TriggerClientEvent('ox_lib:notify', source, {
            id = 'ralle-jobcenter:error', 
            description = locale('too_far_away'),
            duration = 5000,
            type = 'error'
        })
    end
end)

lib.addCommand('jobs', {
    help = locale('job_command_help'),
}, function(source, args, raw)
    local player = Ox.GetPlayerFromUserId(source)
    local groups = player.getGroups()
end)