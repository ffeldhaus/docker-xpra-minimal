#!/bin/bash

set -e

exec /usr/bin/xpra start --daemon=no --start-child="$@"
