#!/bin/sh
set -e

echo "Starting application as user: $(whoami)"
exec node server.js
