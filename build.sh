#!/bin/sh

set -eux

# cd Code

arduino-cli compile --fqbn esp32:esp32:esp32 studio_lights --libraries Libraries --log


case "${1:-}" in
  noupload|--no-upload|-n)
    echo "Skipping upload (arg: ${1:-})"
    ;;
  *)
    PORT=${PORT:-/dev/tty.usbserial-0001}
    echo "Uploading to ${PORT}..."
    sleep 1
    arduino-cli upload studio_lights -p "$PORT" --fqbn esp32:esp32:esp32 -v
    ;;
esac
