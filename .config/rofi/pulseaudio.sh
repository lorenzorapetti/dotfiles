#!/bin/sh

outputs() {
    OUTPUT=$(pactl list short sinks | cut -f 2 | rofi -dmenu -p "Output" -mesg "Select prefered output source")
    pacmd set-default-sink "$OUTPUT" >/dev/null 2>&1

    for playing in $(pacmd list-sink-inputs | awk '$1 == "index:" {print $2}'); do
        pacmd move-sink-input "$playing" "$OUTPUT" >/dev/null 2>&1
    done
}

inputs() {
    INPUT=$(pactl list short sources | cut -f 2 | grep input | rofi -dmenu -p "Input" -mesg "Select prefered input source")
    pacmd set-default-source "$INPUT" >/dev/null 2>&1

    for recording in $(pacmd list-source-outputs | awk '$1 == "index:" {print $2}'); do
        pacmd move-source-output "$recording" "$INPUT" >/dev/null 2>&1
    done
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
