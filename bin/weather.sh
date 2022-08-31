WAYBAR_WEATHER_JSON_TEXT=$(curl 'wttr.in/?m&format=%t')
if [[ $WAYBAR_WEATHER_JSON_TEXT == Unknown* ]] ; then
	WAYBAR_WEATHER_JSON_TEXT="$(ansiweather -l 'White River Junction' -a false -w false -i false -h false -p false -s false -d false | sed -e 's/[ \t]*Weather.*://g'| tr -d '[:space:]')"
	WAYBAR_WEATHER_JSON_TOOLTIP=""
	WAYBAR_WEATHER_JSON_CLASS=""
	WAYBAR_WEATHER_JSON_ICON=""
else
	WAYBAR_WEATHER_JSON_TOOLTIP=$(curl 'wttr.in/?m&format=%t+%C+%c')
	WAYBAR_WEATHER_JSON_CLASS=$(curl 'wttr.in/?m&format=%C')
	WAYBAR_WEATHER_JSON_CLASS=${WAYBAR_WEATHER_JSON_CLASS%% *}
	WAYBAR_WEATHER_JSON_ICON=$(curl 'wttr.in/?m&format=%c')
	WAYBAR_WEATHER_JSON_TEXT="${WAYBAR_WEATHER_JSON_TEXT} ${WAYBAR_WEATHER_JSON_ICON::1}"
fi

WAYBAR_WEATHER_JSON="{
	\"text\":\"${WAYBAR_WEATHER_JSON_TEXT}\",
	\"tooltip\":\"${WAYBAR_WEATHER_JSON_TOOLTIP}\",
	\"class\":\"${WAYBAR_WEATHER_JSON_CLASS}\",
	\"icon\":\"${WAYBAR_WEATHER_JSON_ICON}\"
}\n"

echo $WAYBAR_WEATHER_JSON
