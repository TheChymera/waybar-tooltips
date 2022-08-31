# Waybar Tooltip Generators

A set of scripts which return JSON strings usable by Waybar.

## Khal Waybar Tooltip

Usable by adding the following to the Waybar config (e.g. `~/.config/waybar/config`):

```json
    "custom/events": {
        "format": "{} ",
        "tooltip": true,
        "interval": 120,
        "format-icons": {
            "default": ""
        },
        "exec": "$HOME/.config/waybar/khal.py",
        "on-click": "alacritty --class khal_float -e sh -c \"ikhal\"",
        "return-type": "json"
    },
```

## Weather Waybar Tooltip

Usable by adding the following to the Waybar config (e.g. `~/.config/waybar/config`):

```json
    "custom/weather": {
        "exec": "~/.config/waybar/weather.sh",
        "format": "{}",
        "return-type": "json",
        "interval": 300,
        "tooltip": "true",
    },
```

Additionally, custom weather styles can be included in e.g. `~/.config/waybar/style.css`:

```json
#custom-weather {
    background-color: #000000;
    margin: 0 4px;
    padding: 0 3px;
}

#custom-weather.Clear {
    border-top: 1px solid #0040d0;
    background-color: #000000;
}
#custom-weather.Sunny {
    border-top: 1px solid #959505;
    background-color: #000000;
}
#custom-weather.Partly {
    border-top: 1px solid #6565a0;
    background-color: #000000;
}
#custom-weather.Thunderstorm {
    border-top: 1px solid #404090;
    background-color: #000000;
}
#custom-weather.Mist {
    border-top: 2px solid #808090;
    background-color: #000000;
}
#custom-weather.Overcast {
    border-top: 2px solid #6a6a6a;
    background-color: #000000;
}
```
