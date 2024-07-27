Config = {}

-- The location of the jobcenter
Config.location = vec3(-263.977, -966.500, 30.224)
--The Distance needed between the location and player to show the marker
Config.Distance = 10

--To change the language of the blip. You will need to edit a locale file
Config.blip = {
    location = vec3(-261.683, -971.051, 144.553),
    BlipSprite = 351,
    BlipColour = 0,
}

-- The jobs you want displayed at the jobcenter
Config.jobs = {
    {job = 'garbage', label = 'Garbage job'},
    {job = 'police', label = 'Police job'},
    {job = 'ems', label = 'Paramedic job'},
    {job = 'mechanic', label = 'Mechanic job'},
}