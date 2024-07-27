# Ralle-jobcenter

Ralle-jobcenter is a lightweight jobcenter in FiveM that runs on ox_core as of right now. It is a simple resource that allows for customization and translation if english is not suitable for your server

## Installation

Using git:

- Open Command prompt or your shell of choice.
- Navigate to folder where you want the resource.
- Enter the command below.

```git
git clone https://github.com/RalleeDev/ralle-jobcenter.git
```

- You have now downloaded the resource and are now ready to go.

Downloading manually:

- Click on code and Download ZIP.
- Wait for it to be downloaded and extract the zip.
- Now place the it in the resource folder of your server.
- Add the following to your server.cfg

```cfg
start ralle-jobcenter
```

- You have now downloaded the resource and are now ready to go.

## Showcase

## Configuring

If you want to configure the resource. To add jobs or change language then i have made a short guide below.

Adding jobs:

- Head into the folder where the resource is located
- Open config.lua
- Find the jobs table

```lua
Config.jobs = {
    {job = 'garbage', label = 'Garbage job'},
    {job = 'police', label = 'Police job'},
    {job = 'ems', label = 'Mechanic job'},
    {job = 'mechanic', label = 'Mechanic job'},
}
```

- Add a new line and insert this:

`{job = 'job', label = 'Job label'},`

- Replace 'job' with the job name from the databse
- Replace 'Job label' with the text you wanna have shown in the jobcenter menu.
- You are now done
- You can add as many jobs in as you want but alot may confuse players.

Adding a new language:

- Head into the folder where the resource is located.
- Locate the `locales` folder and enter.
- Make a copy of `en.json` and paste
- Rename `en` to your contries language code. *You can find yours [here](http://www.lingoes.net/en/translator/langcode.htm)*
- Translate the text
- Head into your server.cfg and the following command in:

```cfg
setr ox:locale "en"
```

- Replace en with your contries language code and restart the server
- You have now configured the jobcenter🎉

## Contributing

If you want to contribute to the project, feel free to open a pull request with a new feature or one of the things on the todo list below

TODO list:

- Add Target support
- Refactor code for less eye pain
- Make a showcase
- Optimize the script where possible

## License

```md
    Copyright (C) 2024  RalleeDev

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/gpl-3.0.html>.
```
