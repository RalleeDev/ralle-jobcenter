local useTarget = GetConvar("inventory:target", "false")
print(useTarget)
lib.locale() -- for locale support

-- Add the blip to the map
local blip = AddBlipForCoord(Config.blip.location.x, Config.location.y, Config.location.z)
SetBlipSprite(blip, Config.blip.BlipSprite)
SetBlipColour(blip, Config.blip.BlipColour)
SetBlipAsShortRange(blip, true)
BeginTextCommandSetBlipName('STRING')
AddTextComponentSubstringPlayerName(locale('job_center'))
EndTextCommandSetBlipName(blip)

--Register context menus for the jobcenter
local jobs = {}
for i, job in ipairs(Config.jobs) do
    table.insert(jobs, {
        title = job.label,
        onSelect = function()
            ChangeJobs(job.job)
        end
    })
end

lib.registerContext({
    id = 'ralle-jobcenterMenu',
    title = locale('job_center'),
    canClose = true,
    options = jobs
})

if useTarget == false then
        --Jobcenter zone
    local point = lib.points.new({
        coords = Config.location,
        distance = Config.Distance,
    })

    local marker = lib.marker.new({
        coords = Config.location,
        type = 1,
    })

    function point:nearby()
        marker:draw()
        if self.currentDistance < 1.5 then
            if not lib.isTextUIOpen() then
                lib.showTextUI(string.format('[E] - ' .. locale('open_job_center')))
            end

            if IsControlJustPressed(0, 51) then
                lib.showContext('ralle-jobcenterMenu')
            end
        else
            local isOpen, currentText = lib.isTextUIOpen()
            if isOpen and currentText == string.format('[E] - ' .. locale('open_job_center')) then
                lib.hideTextUI()
            end
        end
    end
elseif useTarget == 'true' then
    local BoxZone = exports.ox_target:addBoxZone({
        coords = Config.location,
        size = vec3(3, 3, 3),
        rotation = 45,
        drawSprite = true,
        options = {
            label = locale('open_job_center'),
            name = 'open_job_center',
            icon = 'far fa-id-badge',
            distance = 1.5,
            onSelect = function(data)
                lib.showContext('ralle-jobcenterMenu')
            end
        }
    })
end

function ChangeJobs(job)
    TriggerServerEvent('ralle-jobcenter:Setjob', job, 1)
end