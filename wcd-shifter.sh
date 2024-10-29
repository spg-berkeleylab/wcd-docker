# Setup Wafefield collider docker image within shifter.
# Images prepared with (all versions listed), and they're short-description that can be used to set them up:
# main -- docker:wcd:main-alma9
#
# Any new image needs to be pulled once (just from one user), using e.g.:
# $ shifterimg -v pull docker:spagan/wcd:main-alma9
#

usage() {
   echo "Usage: $0 [version]"
   echo "Supported list for argument versions:"
   echo "- main (default)"
   echo
}


IMAGE_SHORT="main" ## default
IMAGE=""
if ! [ -z "$1" ]; then
   if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
      usage
      exit 1
   else
      IMAGE_SHORT="$1"
   fi
fi

case ${IMAGE_SHORT} in
   "main")
      IMAGE_SHORT="main"
      IMAGE="docker:spagan/wcd:main-alma9"
      ;;
   *)
      echo "ERROR: Invalid image short-name as argument."
      usage
      exit 2
      ;;
esac

export XDG_RUNTIME_DIR="${TMPDIR:-/tmp}/`whoami`/run"
mkdir -p ${XDG_RUNTIME_DIR}
echo "Starting Wakefield Collider Detector software image ${IMAGE_SHORT}"
shifter --image=${IMAGE} --volume=/global/cfs/cdirs/atlas/spgriso/WFA/WarpX-out/:/data/WarpX-out/ -- /bin/bash
