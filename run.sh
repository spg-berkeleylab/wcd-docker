#!/bin/bash
# Example running docker command

VERSION="main-alma9"
docker run -ti --rm \
       --env DISPLAY=${DISPLAY} --env USER=${USER} --env WCD_VER=${VERSION}\
       --user=$(id -u $USER):$(id -g $USER) \
       -v ${HOME}/.Xauthority:/home/${USER}/.Xauthority -v ${HOME}/.ssh:/home/${USER}/.ssh \
       --net=host \
       --entrypoint /bin/bash \
       spagan/wcd:${VERSION}

#       -v ${PWD}:/home/${USER} -w /home/${USER} \
