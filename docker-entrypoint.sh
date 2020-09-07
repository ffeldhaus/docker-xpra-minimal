#!/bin/bash

# start xpra as xpra user with command specified in dockerfile as CMD or passed as parameter to docker run
runuser -l xpra -c "/usr/bin/xpra start --daemon=no --start-child='$@'"