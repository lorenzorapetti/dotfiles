#!/bin/sh

outputs() {
    OUTPUT=$(pactl list short sinks | cut  -f 2 | rofi -dmenu -p "Output" -mesg "Select prefered output source" )
    pacmd set-default-sink "$OUTPUT" >/dev/null 2>&1

    for playing in $(pacmd list-sink-inputs | awk '$1 == "index:" {print $2}'); do
        pacmd move-sink-input "$playing" "$OUTPUT" >/dev/null 2>&1
    done
}

inputs() {
    INPUT=$(pactl list short sources | cut  -f 2 | grep input | rofi -dmenu -p "Input" -mesg "Select prefered input source" )
    pacmd set-default-source "$INPUT" >/dev/null 2>&1

    for recording in $(pacmd list-source-outputs | awk '$1 == "index:" {print $2}'); do
        pacmd move-source-output "$recording" "$INPUT" >/dev/null 2>&1
    done
}

get_default_sink() {
    pacmd stat | awk -F": " '/^Default sink name: /{print $2}'
}

output_volume() {
     pacmd list-sinks | awk '/^\s+name: /{indefault = $2 == "'"<$(get_default_sink)>"'"}
             /^\s+muted: / && indefault {muted=$2}
             /^\s+volume: / && indefault {volume=$5}
             END { print muted=="no"?volume:"Muted" }'
}

get_default_source() {
    pacmd stat | awk -F": " '/^Default source name: /{print $2}'
}

input_volume() {
     pacmd list-sources | awk '/^\s+name: /{indefault = $2 == "'"<$(get_default_source)>"'"}
             /^\s+muted: / && indefault {muted=$2}
             /^\s+volume: / && indefault {volume=$5}
             END { print muted=="no"?volume:"Muted" }'
}

case "$1" in
    --output)
        outputs
    ;;
    --input)
        inputs
    ;;
    *)
        echo "Wrong argument"
    ;;
esac