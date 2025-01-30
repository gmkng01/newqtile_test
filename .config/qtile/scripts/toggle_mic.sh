#!/bin/bash

# Get the current mute status of the default microphone
mute_status=$(amixer get Capture | grep '\[on\]' | wc -l)

if [ "$mute_status" -eq 0 ]; then
  # Microphone is muted, so unmute it
  amixer set Capture cap
#   echo "Microphone unmuted."
else
  # Microphone is unmuted, so mute it
  amixer set Capture nocap
#   echo "Microphone muted."
fi