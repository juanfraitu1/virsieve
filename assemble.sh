SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

FILE_1=$1

# Stop if any error is found
set -ueox pipefail

mkdir -p $SCRIPTPATH/Assembly

megahit -r ${1} -o $SCRIPTPATH/Assembly/$(basename ${1%%.*}) --out-prefix $(basename ${1%%.*})


