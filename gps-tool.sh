#!/bin/sh
# List GPS content
# From laptop

# Did not work on back usb ports (2 or 3). Had to switch to side
# port for this to work.

# Download all tracks to gpx
gpsbabel -t -i garmin -f /dev/ttyUSB1 -o gpx -F tracks.gpx

# Download all tracks to kml google
gpsbabel -t -i garmin -f /dev/ttyUSB1 -o kml -F 17-08-20.kml

