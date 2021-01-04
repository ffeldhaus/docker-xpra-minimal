#!/bin/sh

# run additional preparation steps
for f in docker-prepare*.sh; do source $f; done

# start xpra as xpra user with command specified in dockerfile as CMD or passed as parameter to docker run
CMD="XPRA_PASSWORD=$XPRA_PASSWORD /usr/bin/xpra start --daemon=no --start-child='$@'"
runuser -l $XPRA_RUNUSER -c "$CMD"