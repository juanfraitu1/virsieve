SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

FILE_1=$1

DATABASE=$2

# Stop if any error is found
set -ueox pipefail

mkdir -p $SCRIPTPATH/HMM

phmmer -E 0.00001 --tblout=$SCRIPTPATH/HMM/$(basename ${1%%.*})".tblout" --domtblout=$SCRIPTPATH/HMM/$(basename ${1%%.*})".domtblout" $1 $2
