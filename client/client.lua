lib.locale()

local point = lib.points.new({
    coords = Config.location,
    distance = 20,
})

local marker = lib.marker.new({
    coords = Config.location,
    type = 1,
})

local jobs = {}
for i, job in ipairs(Config.jobs) do
    table.insert(jobs, {
        title = job.label,
        onSelect = function()
            ChangeJobs(job.job)
        end
    })
end

function point:nearby()
    marker:draw()

    if self.currentDistance < 1.5 then
        if not lib.isTextUIOpen() then
            lib.showTextUI(locale('open_job_center'))
        end

        if IsControlJustPressed(0, 51) then
            lib.showContext('ralle-jobcenterMenu')
        end
    else
        local isOpen, currentText = lib.isTextUIOpen()
        if isOpen and currentText == locale('open_job_center') then
            lib.hideTextUI()
        end
    end
end

lib.registerContext({
    id = 'ralle-jobcenterMenu',
    title = locale('job_center'),
    canClose = true,
    options = jobs
})

function ChangeJobs(job)
    TriggerServerEvent('ralle-jobcenter:Setjob', job, 1)
end