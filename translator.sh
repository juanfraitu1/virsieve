
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

FILE_1=$1

# Stop if any error is found
set -ueox pipefail

mkdir -p $SCRIPTPATH/Translations

translate6frames.sh in=${1} out=$SCRIPTPATH/Translations/$(basename ${1%%.*})".faa" --overwrite=true
