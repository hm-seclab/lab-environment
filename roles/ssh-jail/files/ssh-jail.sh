#!/bin/bash

# This version uses the normal docker
# Actually not only /lab is persistent also /etc and /home so changes by adding new users/groups get persistent also.

containerize()
{
    docker run -it \
        --rm \
        --hostname "lab-env-$USER" \
        --net none \
        --cap-drop=SYS_CHROOT --cap-drop=NET_BIND_SERVICE --cap-drop=NET_RAW --cap-drop=CAP_KILL \
        -v $USER-etc:/etc -v $USER-lab:/lab  -v $USER-home:/home \
        --name="$USER-$(date +%s)" --add-host lab-env-$USER:127.0.0.1 \
        ssh-jail bash
}
echo "Welcome $USER!"
echo "Please note:"
echo " - Network is unavailable"
echo " - only /lab is persistent"
echo "Starting environment ..."

containerize

echo "Stopping environment ..."